module TruiSMS
  class MessageSplitter
    def initialize(formatter)
      @formatter = formatter
    end

    def split(text)
      texts = split_by_length(text, @formatter.max_length(text))
      format_texts(texts)
    end

    private

    def split_by_length(str, length)
      result = [str]
      while result[-1].size > length
        t = result[-1]
        result[-1] = t[0...length]
        result << t[length..-1]
      end

      result
    end

    def format_texts(texts)
      total = texts.size

      texts.map.with_index do |text, i|
        index = i + 1
        formatted_text = @formatter.format(index, total, text)
        Message.new(formatted_text)
      end
    end
  end
end
