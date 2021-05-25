require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "order_email" do
    let(:mail) { OrderMailer.order_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Order email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
