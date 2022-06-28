# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:post) { FactoryBot.create(:post) }
  let!(:user) { FactoryBot.create(:user) }
  describe 'GET /index' do
    it 'reutrns a 302 response without login' do
      get posts_path
      expect(response).to have_http_status '302'
    end

    # it 'reutrns a 200 response with login' do
    #   session_params = { session: { email: user.email, password: user.password } }
    #   post user_session_path, params: session_params
    #   get posts_path
    #   expect(response).to have_http_status '200'
    # end
  end
end
