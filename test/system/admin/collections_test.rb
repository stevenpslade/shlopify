require "application_system_test_case"

class Admin::CollectionsTest < ApplicationSystemTestCase
  setup do
    @admin_collection = admin_collections(:one)
  end

  test "visiting the index" do
    visit admin_collections_url
    assert_selector "h1", text: "Admin/Collections"
  end

  test "creating a Collection" do
    visit admin_collections_url
    click_on "New Admin/Collection"

    click_on "Create Collection"

    assert_text "Collection was successfully created"
    click_on "Back"
  end

  test "updating a Collection" do
    visit admin_collections_url
    click_on "Edit", match: :first

    click_on "Update Collection"

    assert_text "Collection was successfully updated"
    click_on "Back"
  end

  test "destroying a Collection" do
    visit admin_collections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collection was successfully destroyed"
  end
end
