class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    all_posts
  end

  private
    def all_posts
      @posts = Post.all
    end
end
