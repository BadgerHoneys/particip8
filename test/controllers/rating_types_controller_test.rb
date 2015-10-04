require 'test_helper'

class RatingTypesControllerTest < ActionController::TestCase
  setup do
    @rating_type = rating_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_types)
  end

  test "should create rating_type" do
    assert_difference('RatingType.count') do
      post :create, rating_type: { name: @rating_type.name, scale: @rating_type.scale }
    end

    assert_response 201
  end

  test "should show rating_type" do
    get :show, id: @rating_type
    assert_response :success
  end

  test "should update rating_type" do
    put :update, id: @rating_type, rating_type: { name: @rating_type.name, scale: @rating_type.scale }
    assert_response 204
  end

  test "should destroy rating_type" do
    assert_difference('RatingType.count', -1) do
      delete :destroy, id: @rating_type
    end

    assert_response 204
  end
end
