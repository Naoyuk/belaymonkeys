class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @partnerships = @user.partnerships
  end
end