# frozen_string_literal: true

class PartnershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @partners = current_user.partners
    messages_or_new_message = Partnership.find_or_create_messages(current_user.id, params[:partner_id])
    return if messages_or_new_message.nil?

    if !messages_or_new_message[:messages].nil? && !messages_or_new_message[:messages].empty?
      @messages = messages_or_new_message[:messages]
      # @message = Message.new(chat_id: messages_or_new_message[:messages][0].chat_id, user_id: current_user.id) 
    else # !messages_or_new_message[:message].nil?
      # @message = messages_or_new_message[:message]
    end
  end

  def create
    current_user.send_invitation(params[:partner])
    @user = User.find(params[:partner])
    render template: 'users/show'
  end

  def accept
    partnership = Partnership.where(user_id: params[:partner_id], partner_id: current_user.id)
    partnership[0].update_columns(confirmed: true)
    flash.now.notice = 'A request has been accepted.'

    @user = User.find(current_user.id)
    redirect_to user_path(@user)
    # render template: 'users/show'
  end

  def destroy
    partnership = Partnership.find(Partnership.find_invitation(current_user.id, params[:partner_id].to_i))
    partnership.destroy
    flash.now.notice = 'Deleted a request.'

    @user = User.find(current_user.id)
    redirect_to user_path(@user)
    # render template: 'users/show'
  end
end
