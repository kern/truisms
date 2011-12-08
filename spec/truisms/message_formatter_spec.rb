require "spec_helper"

describe TruiSMS::MessageFormatter do
  let(:formatter) { TruiSMS::MessageFormatter.new }

  describe "#max_length" do
    it "has to be implemented" do
      expect {
        formatter.max_length
      }.to raise_error
    end
  end

  describe "#max_index" do
    it "has to be implemented" do
      expect {
        formatter.max_index
      }.to raise_error
    end
  end

  describe "#format" do
    it "has to be implemented" do
      expect {
        formatter.format(0, 0, "")
      }.to raise_error
    end
  end
end
