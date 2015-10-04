require 'test_helper'

class EvaluationTypesControllerTest < ActionController::TestCase
  setup do
    @evaluation_type = evaluation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_types)
  end

  test "should create evaluation_type" do
    assert_difference('EvaluationType.count') do
      post :create, evaluation_type: { name: @evaluation_type.name }
    end

    assert_response 201
  end

  test "should show evaluation_type" do
    get :show, id: @evaluation_type
    assert_response :success
  end

  test "should update evaluation_type" do
    put :update, id: @evaluation_type, evaluation_type: { name: @evaluation_type.name }
    assert_response 204
  end

  test "should destroy evaluation_type" do
    assert_difference('EvaluationType.count', -1) do
      delete :destroy, id: @evaluation_type
    end

    assert_response 204
  end
end
