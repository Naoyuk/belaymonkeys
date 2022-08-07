require 'rails_helper'

RSpec.describe "Partners", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /index" do
    it "returns http success" do
      sign_in user
      get partners_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      sign_in user
      get request_path(partner: user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      sign_in user
      get "/partners/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
