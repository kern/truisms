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

        if total > MAX_MESSAGES
          raise TruiSMS::MessageTooLongError.new
        else
          messages.map.with_index do |text, i|
            index = i + 1
            "(#{index}/#{total}) #{text}"
          end
        end
      end
    end
  end
end
