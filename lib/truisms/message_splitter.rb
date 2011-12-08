module TruiSMS
  class MessageSplitter
    SPLIT_MESSAGE_LENGTH = 154

    def split(text)
      if text.size > Message::MAX_LENGTH
        text_array = [text]
        while text_array[-1].size > SPLIT_MESSAGE_LENGTH
          t = text_array[-1]
          text_array[-1] = t[0...SPLIT_MESSAGE_LENGTH]
          text_array << t[SPLIT_MESSAGE_LENGTH..-1]
        end

        text_array.map.with_index do |t, i|
          Message.new(add_text_number(i + 1, text_array.size, t))
        end
      else
        [Message.new(text)]
      end
    end

    private

    def add_text_number(current, total, text)
      "(#{current}/#{total}) #{text}"
    end
  end
end
