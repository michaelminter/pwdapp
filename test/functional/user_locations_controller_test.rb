require 'test_helper'

class UserLocationsControllerTest < ActionController::TestCase
  setup do
    @user_location = user_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_location" do
    assert_difference('UserLocation.count') do
      post :create, user_location: { location_id: @user_location.location_id, login_name: @user_location.login_name, user_id: @user_location.user_id }
    end

    assert_redirected_to user_location_path(assigns(:user_location))
  end

  test "should show user_location" do
    get :show, id: @user_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_location
    assert_response :success
  end

  test "should update user_location" do
    put :update, id: @user_location, user_location: { location_id: @user_location.location_id, login_name: @user_location.login_name, user_id: @user_location.user_id }
    assert_redirected_to user_location_path(assigns(:user_location))
  end

  test "should destroy user_location" do
    assert_difference('UserLocation.count', -1) do
      delete :destroy, id: @user_location
    end

    assert_redirected_to user_locations_path
  end
end
