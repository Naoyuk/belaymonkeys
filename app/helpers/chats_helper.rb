module ChatsHelper
  # return if current_user has a conversations in specific posts
  def has_messages?(post_id: nil, host_user_id: nil, guest_user_id: nil)
    return false unless post_id && host_user_id && guest_user_id

    chats = Chat.where(
      "post_id = ? and host_user_id = ? and guest_user_id = ?",
      post_id, host_user_id, guest_user_id
    )
    return false if chats.count == 0
    true
  end

  def chat_id_by_ids(post_id: nil, host_user_id: nil, guest_user_id: nil)
    return false unless post_id && host_user_id && guest_user_id
    chat = Chat.where('post_id = ? and host_user_id = ? and guest_user_id = ?',
               post_id, host_user_id, guest_user_id)
    return false if chat.size == 0
    chat[0].id
  end

  def message_link_to(post)
    classes = %w[px-2 py-1 rounded font-semibold]

    if post.user_id == current_user.id
      text = 'See Conversation'
      path = chats_path(post_id: post.id)
      classes << 'text-blue-500 border border-blue-500 hover:bg-blue-100'
    elsif has_messages?( post_id: post.id, host_user_id: post.user_id, guest_user_id: current_user.id)
      text = 'Message'
      chat_id = chat_id_by_ids(post_id: post.id, host_user_id: post.user_id, guest_user_id: current_user.id)
      path = chat_path(chat_id)
      classes << 'bg-blue-400 text-white hover:bg-blue-500'
    else
      text = 'Message'
      classes << 'bg-yellow-400 text-white hover:bg-yellow-500'
      path = new_chat_path(post_id: post.id, host_user_id: post.user_id, guest_user_id: current_user.id)
    end

    link_to(path, class: classes) do
      text
    end
  end
end
