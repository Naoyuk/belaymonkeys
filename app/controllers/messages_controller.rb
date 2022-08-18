# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @messages = fetch_messages(params[:partner])
    @partners = current_user.partners
    # @messages = Message.all
    # render partial: 'partnerships/chat'
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to chat_path(@message.chat)
    else
      render chat_path(@message.chat)
    end
  end

  def direct_messages(partner: params[:partner])
    chat_i_am_host = Chat.where(host_user_id: current_user.id, guest_user_id: partner).pluck(:id)
    chat_partner_is_host = Chat.where(host_user_id: partner, guest_user_id: current_user.id).pluck(:id)
    ids = chat_i_am_host + chat_partner_is_host
    @chats = Chat.where(id: ids)
  end

  def create_dm
    # @partners = current_user.partners
    @message = Message.new(message_params)
    if @message.save
      @messages = Chat.find(params[:message][:chat_id]).messages
      render template: 'partnerships/message', locals: { messages: @messages }
    else
      render template: 'partnerships/index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :read, :user_id, :chat_id)
  end
end
