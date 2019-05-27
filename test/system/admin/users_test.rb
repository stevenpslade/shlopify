require "application_system_test_case"

class Admin::UsersTest < ApplicationSystemTestCase
  setup do
    @admin_user = admin_users(:one)
  end

  test "visiting the index" do
    visit admin_users_url
    assert_selector "h1", text: "Admin/Users"
  end

  test "creating a User" do
    visit admin_users_url
    click_on "New Admin/User"

    fill_in "Email", with: @admin_user.email
    fill_in "First name", with: @admin_user.first_name
    fill_in "Last name", with: @admin_user.last_name
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit admin_users_url
    click_on "Edit", match: :first

    fill_in "Email", with: @admin_user.email
    fill_in "First name", with: @admin_user.first_name
    fill_in "Last name", with: @admin_user.last_name
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit admin_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
