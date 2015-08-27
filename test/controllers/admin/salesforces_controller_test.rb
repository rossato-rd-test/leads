require 'test_helper'

class Admin::SalesforcesControllerTest < ActionController::TestCase
  setup do
    @admin_salesforce = admin_salesforces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_salesforces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_salesforce" do
    assert_difference('Admin::Salesforce.count') do
      post :create, admin_salesforce: { client_id: @admin_salesforce.client_id, client_secret: @admin_salesforce.client_secret, password: @admin_salesforce.password, security_token: @admin_salesforce.security_token, username: @admin_salesforce.username }
    end

    assert_redirected_to admin_salesforce_path(assigns(:admin_salesforce))
  end

  test "should show admin_salesforce" do
    get :show, id: @admin_salesforce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_salesforce
    assert_response :success
  end

  test "should update admin_salesforce" do
    patch :update, id: @admin_salesforce, admin_salesforce: { client_id: @admin_salesforce.client_id, client_secret: @admin_salesforce.client_secret, password: @admin_salesforce.password, security_token: @admin_salesforce.security_token, username: @admin_salesforce.username }
    assert_redirected_to admin_salesforce_path(assigns(:admin_salesforce))
  end

  test "should destroy admin_salesforce" do
    assert_difference('Admin::Salesforce.count', -1) do
      delete :destroy, id: @admin_salesforce
    end

    assert_redirected_to admin_salesforces_path
  end
end
