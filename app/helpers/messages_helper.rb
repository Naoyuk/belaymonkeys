module MessagesHelper
  def message_class(message)
    classes = %w[mb-2 p-2 rounded-md]
    classes << 'bg-blue-400 text-white' if message.user.id == current_user.id
    classes << 'bg-gray-200' if message.user.id != current_user.id

    classes.join(" ")
  end
end
