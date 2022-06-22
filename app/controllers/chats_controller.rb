class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = Chat.own(params[:post_id], current_user.id)
  end

  def show
    @chat = Chat.find_or_create_by(id: params[:id]) do |chat|
      chat.post_id = params[:post_id]
      chat.guest_user_id = current_user.id
      chat.host_user_id = params[:host_user_id]
    end
    @message = @chat.messages.build(user_id: current_user.id)
  end

  def new
    @chat = Chat.create(
      post_id: params[:post_id],
      host_user_id: params[:host_user_id],
      guest_user_id: params[:guest_user_id]
    )
    redirect_to chat_path(@chat)
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat
    else
      render 
    end
  end
end
