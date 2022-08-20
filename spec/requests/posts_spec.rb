# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @post = FactoryBot.create(:post)
    @user = @post.user
  end

  context 'when user logged in' do
    before do
      sign_in @user
    end

    describe 'GET /index' do
      it 'reutrns a 200 response' do
        get posts_path
        expect(response).to have_http_status '200'
      end
    end

    describe 'GET /new' do
      it 'returns a 200 response' do
        get new_post_path
        expect(response).to have_http_status '200'
      end
    end

    describe 'POST /create' do
      let(:area) { FactoryBot.create(:area) }

      context 'when all the parameters are valid' do
        it "creates the user's post" do
          valid_attributes = FactoryBot.attributes_for(:post)
          valid_attributes[:area_id] = area.id.to_s

          expect do
            post posts_path, params: {
              post: valid_attributes
            }
          end.to change(@user.posts, :count).by(1)
        end

        it 'redirect to posts list' do
          valid_attributes = FactoryBot.attributes_for(:post)
          valid_attributes[:area_id] = area.id.to_s

          post posts_path, params: { post: valid_attributes }
          expect(response).to redirect_to(posts_url)
        end
      end
    end
  end

  context 'when user not logged in' do
    describe 'GET /index' do
      it 'reutrns a 302 response' do
        get posts_path
        expect(response).to have_http_status '302'
      end
    end

    describe 'GET /new' do
      it 'returns a 302 response' do
        get new_post_path
        expect(response).to have_http_status '302'
      end
    end
  end
end
