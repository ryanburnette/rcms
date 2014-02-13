class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    #@posts = Post.where(:type => nil).order('posts.date DESC').all
    @posts = Post.posts_only.all
  end

  private

    def set_post
      @post = Post.posts_only.friendly.find(params[:id])
    end

end
