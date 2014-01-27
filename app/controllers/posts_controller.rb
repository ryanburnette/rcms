class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @form_action = :create
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @form_action = :update
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to :action => "edit", :id => @post.id, notice: "Post was successfully created."
    else
      render action: "new"
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update()
      redirect_to :action => "edit", :id => @post.id, notice: "Post was successfully updated."
    else
      redirect_to :action => "edit", :id => @post.id, notice: "Post was not updated."
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.permit(:post, :title, :slug, :content, :published)
    end
end
