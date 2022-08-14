# frozen_string_literal: true

module MessagesHelper
  def fetch_messages(partner)
    chat_i_am_host = Chat.where(host_user_id: current_user.id, guest_user_id: partner.id).pluck(:id)
    chat_partner_is_host = Chat.where(host_user_id: partner.id, guest_user_id: current_user.id).pluck(:id)
    ids = chat_i_am_host + chat_partner_is_host
    Message.where(chat_id: ids)
  end

  def message_class(message)
    classes = %w[mb-2 p-2 rounded-md]
    classes << 'bg-blue-400 text-white' if message.user.id == current_user.id
    classes << 'bg-gray-200' if message.user.id != current_user.id

    classes.join(' ')
  end
end
