class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.order('posts.date DESC').all
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

end
