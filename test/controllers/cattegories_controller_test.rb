require 'test_helper'

class CattegoriesControllerTest < ActionController::TestCase
  setup do
    @cattegory = cattegories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cattegories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cattegory" do
    assert_difference('Cattegory.count') do
      post :create, cattegory: { name: @cattegory.name }
    end

    assert_redirected_to cattegory_path(assigns(:cattegory))
  end

  test "should show cattegory" do
    get :show, id: @cattegory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cattegory
    assert_response :success
  end

  test "should update cattegory" do
    patch :update, id: @cattegory, cattegory: { name: @cattegory.name }
    assert_redirected_to cattegory_path(assigns(:cattegory))
  end

  test "should destroy cattegory" do
    assert_difference('Cattegory.count', -1) do
      delete :destroy, id: @cattegory
    end

    assert_redirected_to cattegories_path
  end
end
