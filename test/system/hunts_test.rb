require "application_system_test_case"

class HuntsTest < ApplicationSystemTestCase
  setup do
    @hunt = hunts(:one)
  end

  test "visiting the index" do
    visit hunts_url
    assert_selector "h1", text: "Hunts"
  end

  test "creating a Hunt" do
    visit hunts_url
    click_on "New Hunt"

    fill_in "Expiry date", with: @hunt.expiry_date
    fill_in "Name", with: @hunt.name
    check "No time limit" if @hunt.no_time_limit
    fill_in "Set time limit", with: @hunt.set_time_limit
    fill_in "Start date", with: @hunt.start_date
    fill_in "Winning code", with: @hunt.winning_code
    click_on "Create Hunt"

    assert_text "Hunt was successfully created"
    click_on "Back"
  end

  test "updating a Hunt" do
    visit hunts_url
    click_on "Edit", match: :first

    fill_in "Expiry date", with: @hunt.expiry_date
    fill_in "Name", with: @hunt.name
    check "No time limit" if @hunt.no_time_limit
    fill_in "Set time limit", with: @hunt.set_time_limit
    fill_in "Start date", with: @hunt.start_date
    fill_in "Winning code", with: @hunt.winning_code
    click_on "Update Hunt"

    assert_text "Hunt was successfully updated"
    click_on "Back"
  end

  test "destroying a Hunt" do
    visit hunts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hunt was successfully destroyed"
  end
end
