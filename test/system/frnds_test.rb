require "application_system_test_case"

class FrndsTest < ApplicationSystemTestCase
  setup do
    @frnd = frnds(:one)
  end

  test "visiting the index" do
    visit frnds_url
    assert_selector "h1", text: "Frnds"
  end

  test "creating a Frnd" do
    visit frnds_url
    click_on "New Frnd"

    fill_in "Body", with: @frnd.body
    fill_in "Email", with: @frnd.email
    fill_in "References", with: @frnd.references
    fill_in "User", with: @frnd.user
    click_on "Create Frnd"

    assert_text "Frnd was successfully created"
    click_on "Back"
  end

  test "updating a Frnd" do
    visit frnds_url
    click_on "Edit", match: :first

    fill_in "Body", with: @frnd.body
    fill_in "Email", with: @frnd.email
    fill_in "References", with: @frnd.references
    fill_in "User", with: @frnd.user
    click_on "Update Frnd"

    assert_text "Frnd was successfully updated"
    click_on "Back"
  end

  test "destroying a Frnd" do
    visit frnds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Frnd was successfully destroyed"
  end
end
