class Admin::PostsController < PostsController
  layout("admin")

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts/new
  def new
    @form_action = :create
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @form_action = :update
    set_post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to({:action => "edit", :id => @post.id, notice: "Post was successfully created."})
    else
      render({action: "new"})
    end
  end

  # PATCH/PUT /posts/1
  def update
    set_post
    if @post.update_attributes(post_params)
      redirect_to({:action => 'edit', :id => @post.id, :notice => "foo"})
    else
      render({action: "edit"})
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to(admin_posts_url, {:notice => 'Post was successfully destroyed.'})
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :slug, :content, :published)
    end
end
