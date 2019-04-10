require 'test_helper'

class HuntsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hunt = hunts(:one)
  end

  #should be redirected, since user is not logged in

  test "should not get index" do
    get hunts_url
    assert_response :redirect
  end

  test "should not get new" do
    get new_hunt_url
    assert_response :redirect
  end

  test "should not create hunt" do
    assert_no_difference('Hunt.count') do
      post hunts_url, params: { hunt: { expiry_date: @hunt.expiry_date, name: @hunt.name, no_time_limit: @hunt.no_time_limit, set_time_limit: @hunt.set_time_limit, start_date: @hunt.start_date, winning_code: @hunt.winning_code } }
    end

    assert_redirected_to new_user_session_path
   end

  test "should not show hunt" do
    get hunt_url(@hunt)
    assert_response :redirect
  end

  test "should not get edit" do
    get edit_hunt_url(@hunt)
    assert_response :redirect
  end

  test "should not update hunt" do
    patch hunt_url(@hunt), params: { hunt: { expiry_date: @hunt.expiry_date, name: @hunt.name, no_time_limit: @hunt.no_time_limit, set_time_limit: @hunt.set_time_limit, start_date: @hunt.start_date, winning_code: @hunt.winning_code } }
    assert_redirected_to new_user_session_path
  end

  test "should not destroy hunt" do
    assert_no_difference('Hunt.count') do
      delete hunt_url(@hunt)
    end

    assert_redirected_to new_user_session_path
  end
end
