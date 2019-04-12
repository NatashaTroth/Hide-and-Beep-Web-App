require 'test_helper'

#user not logged in
class HintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hint = hints(:one)
  end

  test "should not get index" do
    get hints_url
    assert_response :redirect
  end

  test "should not get new" do
    get new_hint_url
    assert_response :redirect
  end

  test "should not create hint" do
    assert_no_difference('Hint.count') do
      post hints_url, params: { hint: { hunt_id: @hint.hunt_id, latitude: @hint.latitude, longitude: @hint.longitude, text: @hint.text } }
  end
    assert_redirected_to new_user_session_path
  end


  test "should not get edit" do
    get edit_hint_url(@hint)
    assert_response :redirect
  end

  test "should not update hint" do
    patch hint_url(@hint), params: { hint: { hunt_id: @hint.hunt_id, latitude: @hint.latitude, longitude: @hint.longitude, text: @hint.text } }
    assert_redirected_to new_user_session_path
  end

  test "should not destroy hint" do
    assert_no_difference('Hint.count') do
      delete hint_url(@hint)
    end
    assert_redirected_to new_user_session_path
  end
end


class HintsUserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @hint = hints(:one)
    sign_in(@user)
  end

  test "should not index without hunts_id parameter" do
    get hints_path
    assert_response :redirect
  end

  test "should get new" do
    get new_hint_url
    assert_response :success
  end

  test "should get edit" do
    get edit_hint_url(@hint)
    assert_response :success
  end

  test "should destroy hint" do
    assert_difference('Hint.count', -1) do
      delete hint_url(@hint)
    end
  end
end
