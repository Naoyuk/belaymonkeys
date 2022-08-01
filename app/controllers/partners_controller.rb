class PartnersController < ApplicationController
  before_action :authenticate_user!

  def index
    @partnerships = Partnership.where(user_id: current_user.id)
  end

  def create
    current_user.send_invitation(params[:partner])
    @user = User.find(params[:partner])
    render template: 'users/show'
  end

  def destroy
  end
end
