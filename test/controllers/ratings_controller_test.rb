require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    @rating = ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ratings)
  end

  test "should create rating" do
    assert_difference('Rating.count') do
      post :create, rating: { evaluation_id: @rating.evaluation_id, rating_value: @rating.rating_value, student_id: @rating.student_id }
    end

    assert_response 201
  end

  test "should show rating" do
    get :show, id: @rating
    assert_response :success
  end

  test "should update rating" do
    put :update, id: @rating, rating: { evaluation_id: @rating.evaluation_id, rating_value: @rating.rating_value, student_id: @rating.student_id }
    assert_response 204
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete :destroy, id: @rating
    end

    assert_response 204
  end
end
