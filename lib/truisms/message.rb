module TruiSMS
  class Message
    MAX_LENGTH = 160

    attr_reader :text

    def initialize(text)
      raise MessageTooLongError.new if text.size > MAX_LENGTH
      @text = text
    end
  end
end
