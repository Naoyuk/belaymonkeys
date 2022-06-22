class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to chat_path(@message.chat)
    else
      render chat_path(@message.chat)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :read, :user_id, :chat_id)
  end
end
