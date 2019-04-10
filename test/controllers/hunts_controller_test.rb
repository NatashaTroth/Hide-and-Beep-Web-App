require 'test_helper'

#user not logged in
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


#user logged in
class HuntsControllerUserTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers



  setup do

    @hunt = hunts(:one)
    @user = users(:one)
    #post user_session_path, params: { email: 'test@test.at', encrypted_password: 'aSecret' }
    # sign_in users(:one)
    # get :index
    # assert_response :success

    sign_in(@user)

  end

  # def sign_in(user)
  #   post user_session_path \
  #     "user[email]"    => user.email,
  #     "user[encrypted_password]" => user.encrypted_password
  # end


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
      post hunts_url, params: { hunt: { expiry_date: @hunt.expiry_date, name: "newNameToAvoidUniqueConstraint", no_time_limit: @hunt.no_time_limit, set_time_limit: @hunt.set_time_limit, start_date: @hunt.start_date, winning_code: @hunt.winning_code } }
    end
   end
   

  test "should show hunt" do
    get hunt_url(@hunt)
    assert_response :success
  end

  test "should get edit" do
    get edit_hunt_url(@hunt)
    assert_response :success
  end

  # test "should update hunt" do
  #   patch hunt_url(@hunt), params: { hunt: { expiry_date: @hunt.expiry_date, name: @hunt.name, no_time_limit: @hunt.no_time_limit, set_time_limit: @hunt.set_time_limit, start_date: @hunt.start_date, winning_code: @hunt.winning_code } }
  #   assert_redirected_to controller: "hints", action: "index"
  # end

  test "should destroy hunt" do
    assert_difference('Hunt.count', -1) do
      delete hunt_url(@hunt)
    end

    assert_redirected_to hunts_url
  end

end
