require "spec_helper"

describe TruiSMS::Formatters::DefaultFormatter do
  let(:message) { TruiSMS::Message.new("hello!") }
  let(:long_message) { TruiSMS::Message.new("a" * 190) }
  let(:insanely_long_message) { TruiSMS::Message.new("a" * 9999) }
  let(:formatter) { TruiSMS::Formatters::DefaultFormatter.new }

  describe "#format" do
    context "when the message is already valid" do
      let(:result) { formatter.format(message) }

      it "returns only one message" do
        result.should have(1).message
      end

      it "returns the original message" do
        result[0].should have_text("hello!")
      end
    end

    context "when the message isn't valid" do
      context "when the message would take over 9 messages to send" do
        it "raises an error" do
          expect {
            formatter.format(insanely_long_message)
          }.to raise_error(TruiSMS::MessageTooLongError)
        end
      end

      context "when the message would take less than 9 messages to send" do
        let(:result) { formatter.format(long_message) }

        it "returns the correct number of messages" do
          result.should have(2).messages
        end

        it "formats each message correctly" do
          result[0].should have_text("(1/2) " + "a" * 154)
          result[1].should have_text("(2/2) " + "a" * 36)
        end
      end
    end
  end
end
