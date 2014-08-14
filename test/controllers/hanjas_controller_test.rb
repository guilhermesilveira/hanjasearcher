require 'test_helper'

class HanjasControllerTest < ActionController::TestCase
  setup do
    @hanja = hanjas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hanjas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hanja" do
    assert_difference('Hanja.count') do
      post :create, hanja: { name: @hanja.name }
    end

    assert_redirected_to hanja_path(assigns(:hanja))
  end

  test "should show hanja" do
    get :show, id: @hanja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hanja
    assert_response :success
  end

  test "should update hanja" do
    patch :update, id: @hanja, hanja: { name: @hanja.name }
    assert_redirected_to hanja_path(assigns(:hanja))
  end

  test "should destroy hanja" do
    assert_difference('Hanja.count', -1) do
      delete :destroy, id: @hanja
    end

    assert_redirected_to hanjas_path
  end
end
