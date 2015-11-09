require 'test_helper'

class EvaluationsControllerTest < ActionController::TestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluations)
  end

  test "should create evaluation" do
    assert_difference('Evaluation.count') do
      post :create, evaluation: { evaluation_template_id: @evaluation.evaluation_template_id }
    end

    assert_response 201
  end

  test "should show evaluation" do
    get :show, id: @evaluation
    assert_response :success
  end

  test "should update evaluation" do
    put :update, id: @evaluation, evaluation: { evaluation_template_id: @evaluation.evaluation_template_id }
    assert_response 204
  end

  test "should destroy evaluation" do
    assert_difference('Evaluation.count', -1) do
      delete :destroy, id: @evaluation
    end

    assert_response 204
  end
end
