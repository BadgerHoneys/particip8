require 'test_helper'

class AttendancesControllerTest < ActionController::TestCase
  setup do
    @attendance = attendances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendances)
  end

  test "should create attendance" do
    assert_difference('Attendance.count') do
      post :create, attendance: { current_day_id: @attendance.current_day_id, is_there: @attendance.is_there, user_id: @attendance.user_id }
    end

    assert_response 201
  end

  test "should show attendance" do
    get :show, id: @attendance
    assert_response :success
  end

  test "should update attendance" do
    put :update, id: @attendance, attendance: { current_day_id: @attendance.current_day_id, is_there: @attendance.is_there, user_id: @attendance.user_id }
    assert_response 204
  end

  test "should destroy attendance" do
    assert_difference('Attendance.count', -1) do
      delete :destroy, id: @attendance
    end

    assert_response 204
  end
end