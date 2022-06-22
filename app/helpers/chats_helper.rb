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
    chat = Chat.where('post_id = ? and host_user_id = ? and guest_user_id = ?',
               post_id, host_user_id, guest_user_id)
    chat[0].id
  end
  
  def message_class(message)
    styles = %w[mb-2 p-2 rounded-md]
    styles << 'bg-blue-400 text-white' if message.user.id == current_user.id
    styles << 'bg-gray-200' if message.user.id != current_user.id

    styles_str = ''
    styles.each{|style| styles_str << style + ' '}
    styles_str.chop
  end
end
