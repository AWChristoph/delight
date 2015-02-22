require 'test_helper'

class DcardsControllerTest < ActionController::TestCase
  setup do
    @dcard = dcards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dcards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dcard" do
    assert_difference('Dcard.count') do
      post :create, dcard: { description: @dcard.description }
    end

    assert_redirected_to dcard_path(assigns(:dcard))
  end

  test "should show dcard" do
    get :show, id: @dcard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dcard
    assert_response :success
  end

  test "should update dcard" do
    patch :update, id: @dcard, dcard: { description: @dcard.description }
    assert_redirected_to dcard_path(assigns(:dcard))
  end

  test "should destroy dcard" do
    assert_difference('Dcard.count', -1) do
      delete :destroy, id: @dcard
    end

    assert_redirected_to dcards_path
  end
end
