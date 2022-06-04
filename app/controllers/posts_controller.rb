# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
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
                                 :kind_of_climbing)
  end
end
