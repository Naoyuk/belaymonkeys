require 'rails_helper'

RSpec.describe ChatsHelper, type: :helper do
  describe 'has_messages?' do
    context 'when all the arguments post_id, host_user_id and guest_user_id are given' do
      it 'returns false if chat is not exist' do
        post = FactoryBot.create(:post)
        host = post.user
        guest = FactoryBot.create(:user)
        expect(
          has_messages?(post_id: post.id, host_user_id: host.id, guest_user_id: guest.id)
        ).to eq false
      end

      it 'returns true if chat is exist' do
        message = FactoryBot.create(:message)
        chat = message.chat
        post = chat.post
        host = chat.host
        guest = chat.guest
        expect(
          has_messages?(post_id: post.id, host_user_id: host.id, guest_user_id: guest.id)
        ).to eq true
      end
    end

    context 'when neither post_id or host_user_id or guest_user_id argument is not given' do
      it 'reutrns false' do
        expect(has_messages?(post_id: 1, host_user_id: 1, guest_user_id: nil)).to eq false
        expect(has_messages?(post_id: 1, host_user_id: nil, guest_user_id: 1)).to eq false
        expect(has_messages?(post_id: nil, host_user_id: 1, guest_user_id: 2)).to eq false
      end
    end
  end

  describe 'chat_id_by_ids' do

  end

  describe 'message_class' do

  end
end
