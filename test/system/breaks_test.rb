require "application_system_test_case"

class BreaksTest < ApplicationSystemTestCase
  setup do
    @break = breaks(:one)
  end

  test "visiting the index" do
    visit breaks_url
    assert_selector "h1", text: "Breaks"
  end

  test "should create break" do
    visit breaks_url
    click_on "New break"

    check "Active" if @break.active
    fill_in "End time", with: @break.end_time
    fill_in "Shift", with: @break.shift_id
    fill_in "Start time", with: @break.start_time
    click_on "Create Break"

    assert_text "Break was successfully created"
    click_on "Back"
  end

  test "should update Break" do
    visit break_url(@break)
    click_on "Edit this break", match: :first

    check "Active" if @break.active
    fill_in "End time", with: @break.end_time
    fill_in "Shift", with: @break.shift_id
    fill_in "Start time", with: @break.start_time
    click_on "Update Break"

    assert_text "Break was successfully updated"
    click_on "Back"
  end

  test "should destroy Break" do
    visit break_url(@break)
    click_on "Destroy this break", match: :first

    assert_text "Break was successfully destroyed"
  end
end
