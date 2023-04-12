require "application_system_test_case"

class GcardsTest < ApplicationSystemTestCase
  setup do
    @gcard = gcards(:one)
  end

  test "visiting the index" do
    visit gcards_url
    assert_selector "h1", text: "Gcards"
  end

  test "should create gcard" do
    visit gcards_url
    click_on "New gcard"

    fill_in "Amount", with: @gcard.amount
    fill_in "Code", with: @gcard.code
    fill_in "Description", with: @gcard.description
    fill_in "Email", with: @gcard.email
    click_on "Create Gcard"

    assert_text "Gcard was successfully created"
    click_on "Back"
  end

  test "should update Gcard" do
    visit gcard_url(@gcard)
    click_on "Edit this gcard", match: :first

    fill_in "Amount", with: @gcard.amount
    fill_in "Code", with: @gcard.code
    fill_in "Description", with: @gcard.description
    fill_in "Email", with: @gcard.email
    click_on "Update Gcard"

    assert_text "Gcard was successfully updated"
    click_on "Back"
  end

  test "should destroy Gcard" do
    visit gcard_url(@gcard)
    click_on "Destroy this gcard", match: :first

    assert_text "Gcard was successfully destroyed"
  end
end
