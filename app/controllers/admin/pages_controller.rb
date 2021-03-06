class Admin::PagesController < PagesController

  before_action :authenticate_admin_user!
  before_action :set_page, only: [:show, :edit, :update, :destroy, :update_row_order_position]
  before_action :require_super_admin!, only: [:destroy]

  layout "admin"

  helper_method :post_statuses

  def new
    @form_action = :create
    @page = Page.new
  end

  def index
    @pages = Page.rank(:row_order).all
  end

  def edit
    @form_action = :update
    set_page
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to(edit_admin_page_path(@page), :notice => "Page was successfully created.")
    else
      flash[:alert] = "Nope!"
      render :action => 'new'
    end
  end

  def update
    set_page
    if @page.update_attributes(page_params)
      redirect_to(edit_admin_page_path(@page), :notice => "Page was successfully updated.")
    else
      flash[:alert] = 'nope'
      render :action => 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to(admin_pages_url, {:notice => 'Page was successfully destroyed.'})
  end

  def update_row_order_position
    if @page.update_attribute :row_order_position, page_params[:row_order_position]
      render :layout => false, :json => true
    else
      render :layout => false, :json => false
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def page_params
    params.require(:page).permit(:title, :slug, :content, :date, :status, :admin_user, :admin_user_id, :row_order_position)
  end

end
