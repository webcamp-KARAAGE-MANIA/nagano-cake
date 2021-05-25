require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/customers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/customers/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/customers/confirm"
      expect(response).to have_http_status(:success)
    end
  end

end
