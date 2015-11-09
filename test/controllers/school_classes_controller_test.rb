require 'test_helper'

class SchoolClassesControllerTest < ActionController::TestCase
  setup do
    @school_class = school_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_classes)
  end

  test "should create school_class" do
    assert_difference('SchoolClass.count') do
      post :create, school_class: { end_time: @school_class.end_time, name: @school_class.name, school_id: @school_class.school_id, start_time: @school_class.start_time, teacher_id: @school_class.teacher_id }
    end

    assert_response 201
  end

  test "should show school_class" do
    get :show, id: @school_class
    assert_response :success
  end

  test "should update school_class" do
    put :update, id: @school_class, school_class: { end_time: @school_class.end_time, name: @school_class.name, school_id: @school_class.school_id, start_time: @school_class.start_time, teacher_id: @school_class.teacher_id }
    assert_response 204
  end

  test "should destroy school_class" do
    assert_difference('SchoolClass.count', -1) do
      delete :destroy, id: @school_class
    end

    assert_response 204
  end
end
