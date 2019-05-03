# frozen_string_literal: true

require 'application_system_test_case'

class HintsTest < ApplicationSystemTestCase
  setup do
    @hint = hints(:one)
  end

  test 'visiting the index' do
    visit hints_url
    assert_selector 'h1', text: 'Hints'
  end

  test 'creating a Hint' do
    visit hints_url
    click_on 'New Hint'

    fill_in 'Hunt', with: @hint.hunt_id
    fill_in 'Latitude', with: @hint.latitude
    fill_in 'Longitude', with: @hint.longitude
    fill_in 'Text', with: @hint.text
    click_on 'Create Hint'

    assert_text 'Hint was successfully created'
    click_on 'Back'
  end

  test 'updating a Hint' do
    visit hints_url
    click_on 'Edit', match: :first

    fill_in 'Hunt', with: @hint.hunt_id
    fill_in 'Latitude', with: @hint.latitude
    fill_in 'Longitude', with: @hint.longitude
    fill_in 'Text', with: @hint.text
    click_on 'Update Hint'

    assert_text 'Hint was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Hint' do
    visit hints_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Hint was successfully destroyed'
  end
end
