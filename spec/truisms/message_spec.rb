require "spec_helper"

describe TruiSMS::Message do
  let(:message) { TruiSMS::Message.new("hey there!") }

  describe "#initialize" do
    context "when the message is equal to or less than 160 characters" do
      it "sets the text" do
        message.text.should == "hey there!"
      end
    end

    context "when the message is greater than 160 characters" do
      it "raises an error" do
        expect {
          TruiSMS::Message.new("a" * 161)
        }.to raise_error(TruiSMS::MessageTooLongError)
      end
    end
  end
end
