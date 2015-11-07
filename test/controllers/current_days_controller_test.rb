require 'test_helper'

class CurrentDaysControllerTest < ActionController::TestCase
  setup do
    @current_day = current_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:current_days)
  end

  test "should create current_day" do
    assert_difference('CurrentDay.count') do
      post :create, current_day: { day: @current_day.day, school_class_id: @current_day.school_class_id }
    end

    assert_response 201
  end

  test "should show current_day" do
    get :show, id: @current_day
    assert_response :success
  end

  test "should update current_day" do
    put :update, id: @current_day, current_day: { day: @current_day.day, school_class_id: @current_day.school_class_id }
    assert_response 204
  end

  test "should destroy current_day" do
    assert_difference('CurrentDay.count', -1) do
      delete :destroy, id: @current_day
    end

    assert_response 204
  end
end