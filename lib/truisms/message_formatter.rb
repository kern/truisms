module TruiSMS
  class MessageFormatter
    def max_length
      raise "MessageFormatter subclasses must implement #max_length."
    end

    def max_index
      raise "MessageFormatter subclasses must implement #max_index."
    end

    def format(index, total, text)
      raise "MessageFormatter subclasses must implement #format."
    end
  end
end
