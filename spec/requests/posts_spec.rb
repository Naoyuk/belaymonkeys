# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'reutrns a 200 response' do
      get posts_path
      expect(response).to have_http_status '200'
    end
  end
end
