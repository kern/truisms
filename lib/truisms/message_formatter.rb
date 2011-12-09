module TruiSMS
  class MessageFormatter
    def format(message)
      raise "MessageFormatter subclasses must implement #format."
    end
  end
end
