# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /search' do
    it 'returns http success' do
      get search_path
      expect(response).to have_http_status(302)
    end
  end
end
