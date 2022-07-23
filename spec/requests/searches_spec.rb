# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /search' do
    let(:user) { FactoryBot.create(:user) }

    it 'returns http success' do
      sign_in user
      get search_path
      expect(response).to have_http_status(:success)
    end
  end
end
