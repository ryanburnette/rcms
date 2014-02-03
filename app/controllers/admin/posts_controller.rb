class Admin::PostsController < PostsController
  layout("admin")

  before_action :authenticate_admin_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_super_admin!, only: [:destroy]
  # before_action :set_post, except: [:new, :edit]
  # before_action :can_edit_post, :only => [:edit, :update, :destroy]

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
      redirect_to(edit_admin_post_path(@post), :notice => "Post was successfully created.")
    else
      render({action: "new"})
    end
  end

  # PATCH/PUT /posts/1
  def update
    set_post
    if @post.update_attributes(post_params)
      redirect_to(edit_admin_post_path(@post), :notice => "Post was successfully updated.")
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

    '''
    # method to help with determining role capability
    def can_edit_post 
      unless current_admin.has_role?(:GOD)
        render template: "admin/not_allowed", status: 403
      end
    end
    '''
end
