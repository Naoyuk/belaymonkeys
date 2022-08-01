require 'rails_helper'

RSpec.describe "Partners", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/partners/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/partners/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/partners/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
