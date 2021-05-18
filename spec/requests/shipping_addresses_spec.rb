require 'rails_helper'

RSpec.describe "ShippingAddresses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/shipping_addresses/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/shipping_addresses/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
