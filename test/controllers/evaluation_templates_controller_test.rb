require 'test_helper'

class EvaluationTemplatesControllerTest < ActionController::TestCase
  setup do
    @evaluation_template = evaluation_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_templates)
  end

  test "should create evaluation_template" do
    assert_difference('EvaluationTemplate.count') do
      post :create, evaluation_template: { evaluation_type_id: @evaluation_template.evaluation_type_id, name: @evaluation_template.name, rating_type_id: @evaluation_template.rating_type_id, school_class_id: @evaluation_template.school_class_id }
    end

    assert_response 201
  end

  test "should show evaluation_template" do
    get :show, id: @evaluation_template
    assert_response :success
  end

  test "should update evaluation_template" do
    put :update, id: @evaluation_template, evaluation_template: { evaluation_type_id: @evaluation_template.evaluation_type_id, name: @evaluation_template.name, rating_type_id: @evaluation_template.rating_type_id, school_class_id: @evaluation_template.school_class_id }
    assert_response 204
  end

  test "should destroy evaluation_template" do
    assert_difference('EvaluationTemplate.count', -1) do
      delete :destroy, id: @evaluation_template
    end

    assert_response 204
  end
end
