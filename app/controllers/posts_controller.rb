# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @search = Post.ransack(params[:q])
    # @posts = @search.result
    @posts = Post.where('date >= ?', Date.today)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_url, notice: 'New post was successfully created.'
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:date, :start_time, :end_time, :description,
                                 :area_id, :kind_of_climbing, { pictures: [] })
  end
end
