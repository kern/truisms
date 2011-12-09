require "spec_helper"

describe TruiSMS::Message do
  let(:message) { TruiSMS::Message.new("hey there!") }
  let(:invalid_message) { TruiSMS::Message.new("a" * 190) }

  describe "#initialize" do
    it "sets the text" do
      message.should have_text("hey there!")
    end
  end

  describe "#size" do
    it "returns the size of the text" do
      message.size.should == 10
    end
  end

  describe "#valid?" do
    it "returns true if the text is under 160 characters" do
      message.should be_valid
    end

    it "returns false if the text is over 160 characters" do
      invalid_message.should_not be_valid
    end
  end

  describe "#split_every" do
    let(:result) { invalid_message.split_every(160) }

    it "splits the text into smaller chunks" do
      result[0].should == "a" * 160
      result[1].should == "a" * 30
    end
  end

  describe "#==" do
    it "returns true if the two messages have the same text" do
      message.should == TruiSMS::Message.new("hey there!")
    end

    it "returns false if the two messages have different texts" do
      message.should_not == TruiSMS::Message.new("nope.")
    end
  end
end
