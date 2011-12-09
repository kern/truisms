module TruiSMS
  module Formatters
    class DefaultFormatter < TruiSMS::MessageFormatter
      SPLIT_LENGTH = 154
      MAX_MESSAGES = 9

      def format(message)
        if message.valid?
          [message]
        else
          split_messages = split(message)
          formatted_messages = format_messages(split_messages)
          formatted_messages.map { |m| TruiSMS::Message.new(m) }
        end
      end

      private

      def split(message)
        message.split_every(SPLIT_LENGTH)
      end

      def format_messages(messages)
        total = messages.size
        raise TruiSMS::MessageTooLongError.new if total > MAX_MESSAGES

        messages.map.with_index do |text, i|
          format_message(i + 1, total, text)
        end
      end

      def format_message(index, total, text)
        "(#{index}/#{total}) #{text}"
      end
    end
  end
end
