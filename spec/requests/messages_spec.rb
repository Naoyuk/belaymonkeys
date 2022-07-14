require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "POST /create" do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'when user is logged in' do
      before do
        sign_in @user
      end

      it 'creates a message' do
        chat = FactoryBot.create(:chat)
        expect {
          post messages_path, params: {
            message: {
              body: 'test text',
              read: false,
              chat_id: chat.id,
              user_id: @user.id
            }
          }
        }.to change(Message, :count).by(1)
      end
    end

    context 'when user is not logged in' do
      it 'does not create a message' do
        chat = FactoryBot.create(:chat)
        expect {
          post messages_path, params: {
            message: {
              body: 'test text',
              read: false,
              chat_id: chat.id,
              user_id: @user.id
            }
          }
        }.to change(Message, :count).by(0)
      end
    end
  end
end
