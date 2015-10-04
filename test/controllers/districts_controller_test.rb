require 'test_helper'

class DistrictsControllerTest < ActionController::TestCase
  setup do
    @district = districts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:districts)
  end

  test "should create district" do
    assert_difference('District.count') do
      post :create, district: { name: @district.name }
    end

    assert_response 201
  end

  test "should show district" do
    get :show, id: @district
    assert_response :success
  end

  test "should update district" do
    put :update, id: @district, district: { name: @district.name }
    assert_response 204
  end

  test "should destroy district" do
    assert_difference('District.count', -1) do
      delete :destroy, id: @district
    end

    assert_response 204
  end
end
