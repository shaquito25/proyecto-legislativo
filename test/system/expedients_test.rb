require "application_system_test_case"

class ExpedientsTest < ApplicationSystemTestCase
  setup do
    @expedient = expedients(:one)
  end

  test "visiting the index" do
    visit expedients_url
    assert_selector "h1", text: "Expedients"
  end

  test "should create expedient" do
    visit expedients_url
    click_on "New expedient"

    fill_in "Age", with: @expedient.age
    fill_in "Birth date", with: @expedient.birth_date
    fill_in "Document", with: @expedient.document
    fill_in "Email", with: @expedient.email
    fill_in "Name", with: @expedient.name
    fill_in "Person type", with: @expedient.person_type
    fill_in "Request quantity", with: @expedient.request_quantity
    fill_in "Surname", with: @expedient.surname
    click_on "Create Expedient"

    assert_text "Expedient was successfully created"
    click_on "Back"
  end

  test "should update Expedient" do
    visit expedient_url(@expedient)
    click_on "Edit this expedient", match: :first

    fill_in "Age", with: @expedient.age
    fill_in "Birth date", with: @expedient.birth_date
    fill_in "Document", with: @expedient.document
    fill_in "Email", with: @expedient.email
    fill_in "Name", with: @expedient.name
    fill_in "Person type", with: @expedient.person_type
    fill_in "Request quantity", with: @expedient.request_quantity
    fill_in "Surname", with: @expedient.surname
    click_on "Update Expedient"

    assert_text "Expedient was successfully updated"
    click_on "Back"
  end

  test "should destroy Expedient" do
    visit expedient_url(@expedient)
    click_on "Destroy this expedient", match: :first

    assert_text "Expedient was successfully destroyed"
  end
end
