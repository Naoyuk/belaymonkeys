# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @posts = Post.looks(params[:area_id])
    render template: 'posts/index'
  end
end
