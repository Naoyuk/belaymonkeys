# frozen_string_literal: true

module ChatsHelper
  # return if current_user has a conversations in specific posts
  def messages?(post_id:, host_user_id:, guest_user_id:)
    return false unless post_id && host_user_id && guest_user_id

    chats = Chat.where(
      'post_id = ? and host_user_id = ? and guest_user_id = ?',
      post_id, host_user_id, guest_user_id
    )
    return false if chats.count.zero?

    true
  end

  def chat_id_by_ids(post_id:, host_user_id:, guest_user_id:)
    return false unless post_id && host_user_id && guest_user_id

    chat = Chat.where('post_id = ? and host_user_id = ? and guest_user_id = ?',
                      post_id, host_user_id, guest_user_id)
    return false if chat.size.zero?

    chat[0].id
  end

  def message_link_to(path, text, classes)
    classes << ' px-2 py-1 rounded font-semibold'

    link_to(path, class: classes) do
      text
    end
  end
end
