require "spec_helper"

describe TruiSMS::MessageFormatter do
  let(:formatter) { TruiSMS::MessageFormatter.new }

  describe "#format" do
    it "has to be implemented" do
      expect {
        formatter.format(0, 0, "")
      }.to raise_error
    end
  end
end
