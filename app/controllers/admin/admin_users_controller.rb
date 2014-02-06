class Admin::AdminUsersController < ApplicationController
  layout("admin")
  
  before_action :authenticate_admin_user!
  before_action :set_admin_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/admin_users
  def index
    @admin_admin_users = AdminUser.all
  end

  # GET /admin/admin_users/1
  def show
  end

  # GET /admin/admin_users/new
  def new
    @admin_admin_user = AdminUser.new
  end

  # GET /admin/admin_users/1/edit
  def edit
  end

  # POST /admin/admin_users
  def create
    @admin_admin_user = AdminUser.new(admin_admin_user_params)

    if @admin_admin_user.save
      redirect_to admin_admin_users_path, notice: 'Admin user was successfully created.'
    else
      flash[:alert] = "no"
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/admin_users/1
  def update
    if @admin_admin_user.update(admin_admin_user_params)
      redirect_to @admin_admin_user, notice: 'Admin user was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/admin_users/1
  def destroy
    @admin_admin_user.destroy
    redirect_to admin_admin_users_path, notice: 'User was deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_admin_user
      @admin_admin_user = AdminUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_admin_user_params
      params.require(:admin_admin_user).permit(:name, :email, :password, :password_confirmation, :role)
    end
end
