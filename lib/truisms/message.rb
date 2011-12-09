module TruiSMS
  class Message
    MAX_LENGTH = 160

    attr_reader :text

    def initialize(text)
      @text = text
    end

    def size
      @text.size
    end

    def valid?
      text.size <= MAX_LENGTH
    end

    def split_every(length)
      result = []

      offset = 0
      while offset < @text.size
        result << @text[offset, length]
        offset += length
      end

      result
    end
  end
end
