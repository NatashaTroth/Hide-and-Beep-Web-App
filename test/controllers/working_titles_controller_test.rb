require 'test_helper'

class WorkingTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @working_title = working_titles(:one)
  end

  test "should get index" do
    get working_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_working_title_url
    assert_response :success
  end

  test "should create working_title" do
    assert_difference('WorkingTitle.count') do
      post working_titles_url, params: { working_title: { title: @working_title.title } }
    end

    assert_redirected_to working_titles_url
  end

  test "should show working_title" do
    get working_title_url(@working_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_working_title_url(@working_title)
    assert_response :success
  end

  test "should update working_title" do
    patch working_title_url(@working_title), params: { working_title: { title: @working_title.title } }
    assert_redirected_to working_title_url(@working_title)
  end

  test "should destroy working_title" do
    assert_difference('WorkingTitle.count', -1) do
      delete working_title_url(@working_title)
    end

    assert_redirected_to working_titles_url
  end
end
