# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chats', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET /index' do
    context 'when user logged in' do
      before do
        sign_in @user
      end

      it 'returns http success' do
        get chats_path
        expect(response).to have_http_status '200'
      end
    end

    context 'when user not logged in' do
      it 'returns redirect response' do
        get chats_path
        expect(response).to have_http_status '302'
      end
    end
  end

  describe 'GET /show' do
    before do
      @message = FactoryBot.create(:message)
      @chat = @message.chat
    end

    context 'when user loggedn in' do
      before do
        sign_in @user
      end

      it 'returns http success' do
        get chat_path(@chat)
        expect(response).to have_http_status '200'
      end
    end

    context 'when user not logged in' do
      it 'returns redirect response' do
        get chat_path(@chat)
        expect(response).to have_http_status '302'
      end
    end
  end

  describe 'GET /new' do
    context 'when user loggedn in' do
      before do
        sign_in @user
      end

      it 'returns http success' do
        post = FactoryBot.create(:post)
        host = FactoryBot.create(:host)
        guest = FactoryBot.create(:guest)
        expect do
          get new_chat_path(
            post_id: post.id,
            host_user_id: host.id,
            guest_user_id: guest.id
          )
        end.to change(Chat, :count).by(1)
        expect(response).to have_http_status '302'
      end
    end

    context 'when user not logged in' do
      it 'returns redirect response' do
        get new_chat_path
        expect(response).to have_http_status '302'
      end
    end
  end

  describe 'POST /create' do
    # NOTE: ChatのPOSTに関してはMessageも同時に作成するのでsystem specに書く
  end
end
