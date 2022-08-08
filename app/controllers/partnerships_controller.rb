class PartnershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @partnerships = Partnership.where(user_id: current_user.id)
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
  end

  def destroy
    partnership = Partnership.where(user_id: params[:partner_id], partner_id: current_user.id)
    partnership[0].destroy
    flash.now.notice = 'Deleted a request.'

    # @user = User.find(current_user.id)
    # render template: 'users/show'
  end
end
