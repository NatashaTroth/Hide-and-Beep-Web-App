require 'test_helper'

class HuntsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hunt = hunts(:one)
  end

  test "should get index" do
    get hunts_url
    assert_response :success
  end

  test "should get new" do
    get new_hunt_url
    assert_response :success
  end

  test "should create hunt" do
    assert_difference('Hunt.count') do
      post hunts_url, params: { hunt: { expiry_date: @hunt.expiry_date, name: @hunt.name, no_time_limit: @hunt.no_time_limit, set_time_limit: @hunt.set_time_limit, start_date: @hunt.start_date, winning_code: @hunt.winning_code } }
    end

    assert_redirected_to hunt_url(Hunt.last)
  end

  test "should show hunt" do
    get hunt_url(@hunt)
    assert_response :success
  end

  test "should get edit" do
    get edit_hunt_url(@hunt)
    assert_response :success
  end

  test "should update hunt" do
    patch hunt_url(@hunt), params: { hunt: { expiry_date: @hunt.expiry_date, name: @hunt.name, no_time_limit: @hunt.no_time_limit, set_time_limit: @hunt.set_time_limit, start_date: @hunt.start_date, winning_code: @hunt.winning_code } }
    assert_redirected_to hunt_url(@hunt)
  end

  test "should destroy hunt" do
    assert_difference('Hunt.count', -1) do
      delete hunt_url(@hunt)
    end

    assert_redirected_to hunts_url
  end
end
