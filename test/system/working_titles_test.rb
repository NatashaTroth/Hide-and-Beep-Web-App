require "application_system_test_case"

class WorkingTitlesTest < ApplicationSystemTestCase
  setup do
    @working_title = working_titles(:one)
  end

  test "visiting the index" do
    visit working_titles_url
    assert_selector "h1", text: "Working Titles"
  end

  test "creating a Working title" do
    visit working_titles_url
    click_on "New Working Title"

    fill_in "Title", with: @working_title.title
    click_on "Create Working title"

    assert_text "Working title was successfully created"
    click_on "Back"
  end

  test "updating a Working title" do
    visit working_titles_url
    click_on "Edit", match: :first

    fill_in "Title", with: @working_title.title
    click_on "Update Working title"

    assert_text "Working title was successfully updated"
    click_on "Back"
  end

  test "destroying a Working title" do
    visit working_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Working title was successfully destroyed"
  end
end
