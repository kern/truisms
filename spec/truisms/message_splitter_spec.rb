require "spec_helper"

describe TruiSMS::MessageSplitter do
  let(:splitter) { TruiSMS::MessageSplitter.new }

  describe "#split" do
    context "when the message is less than or equal to 160 characters" do
      let(:result) { splitter.split("testing 123") }

      it "returns a single message" do
        result.should have(1).message
      end

      it "does not split the message" do
        result[0].text.should == "testing 123"
      end
    end

    context "when the message is greater than 160 characters" do
      let(:result) { splitter.split("a" * 161) }

      it "returns multiple messages" do
        result.should have(2).messages
      end

      it "splits the messages at 155 characters each with a little text number" do
        result[0].text.should == ("(1/2) " + ("a" * 154))
        result[1].text.should == ("(2/2) " + ("a" * 7))
      end
    end
  end
end
