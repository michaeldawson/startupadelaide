require "spec_helper"

describe AdminMailer do
  describe "contact" do
    let(:mail) { AdminMailer.contact }

    it "renders the headers" do
      mail.subject.should eq("Contact")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
