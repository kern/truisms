module TruiSMS
  class DefaultFormatter < MessageFormatter
    def max_index
      9
    end

    def max_length(text)
      if text.size <= 160
        160
      else
        154
      end
    end

    def format(index, total, text)
      if total == 1
        text
      else
        "(#{index}/#{total}) #{text}"
      end
    end
  end
end
