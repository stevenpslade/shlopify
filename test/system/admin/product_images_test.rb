require "application_system_test_case"

class Admin::ProductImagesTest < ApplicationSystemTestCase
  setup do
    @admin_product_image = admin_product_images(:one)
  end

  test "visiting the index" do
    visit admin_product_images_url
    assert_selector "h1", text: "Admin/Product Images"
  end

  test "creating a Product image" do
    visit admin_product_images_url
    click_on "New Admin/Product Image"

    fill_in "Image", with: @admin_product_image.image
    fill_in "Product", with: @admin_product_image.product_id
    click_on "Create Product image"

    assert_text "Product image was successfully created"
    click_on "Back"
  end

  test "updating a Product image" do
    visit admin_product_images_url
    click_on "Edit", match: :first

    fill_in "Image", with: @admin_product_image.image
    fill_in "Product", with: @admin_product_image.product_id
    click_on "Update Product image"

    assert_text "Product image was successfully updated"
    click_on "Back"
  end

  test "destroying a Product image" do
    visit admin_product_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product image was successfully destroyed"
  end
end
