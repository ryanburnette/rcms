require 'test_helper'

class Admin::AdminUsersControllerTest < ActionController::TestCase
  setup do
    @admin_admin_user = admin_admin_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_admin_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_admin_user" do
    assert_difference('Admin::AdminUser.count') do
      post :create, admin_admin_user: {  }
    end

    assert_redirected_to admin_admin_user_path(assigns(:admin_admin_user))
  end

  test "should show admin_admin_user" do
    get :show, id: @admin_admin_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_admin_user
    assert_response :success
  end

  test "should update admin_admin_user" do
    patch :update, id: @admin_admin_user, admin_admin_user: {  }
    assert_redirected_to admin_admin_user_path(assigns(:admin_admin_user))
  end

  test "should destroy admin_admin_user" do
    assert_difference('Admin::AdminUser.count', -1) do
      delete :destroy, id: @admin_admin_user
    end

    assert_redirected_to admin_admin_users_path
  end
end
