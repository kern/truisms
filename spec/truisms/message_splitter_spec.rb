require "spec_helper"

describe TruiSMS::MessageSplitter do
  let(:formatter) { TruiSMS::DefaultFormatter.new }
  let(:splitter) { TruiSMS::MessageSplitter.new(formatter) }

  describe "#split" do
    context "when the message is less than or equal to 160 characters" do
      let(:result) { splitter.split("testing 123") }

      it "returns a single message" do
        result.should have(1).message
      end

      it "does not split the message" do
        result[0].should have_text("testing 123")
      end
    end

    context "when the message is greater than 160 characters" do
      let(:result) { splitter.split("a" * 161) }

      it "returns multiple messages" do
        result.should have(2).messages
      end

      it "splits the messages according to the formatter settings" do
        result[0].should have_text("(1/2) " + ("a" * 154))
        result[1].should have_text("(2/2) " + ("a" * 7))
      end
    end
  end
end
