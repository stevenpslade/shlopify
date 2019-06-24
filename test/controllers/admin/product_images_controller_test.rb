require 'test_helper'

class Admin::ProductImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_product_image = admin_product_images(:one)
  end

  test "should get index" do
    get admin_product_images_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_image_url
    assert_response :success
  end

  test "should create admin_product_image" do
    assert_difference('Admin::ProductImage.count') do
      post admin_product_images_url, params: { admin_product_image: { image: @admin_product_image.image, product_id: @admin_product_image.product_id } }
    end

    assert_redirected_to admin_product_image_url(Admin::ProductImage.last)
  end

  test "should show admin_product_image" do
    get admin_product_image_url(@admin_product_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_image_url(@admin_product_image)
    assert_response :success
  end

  test "should update admin_product_image" do
    patch admin_product_image_url(@admin_product_image), params: { admin_product_image: { image: @admin_product_image.image, product_id: @admin_product_image.product_id } }
    assert_redirected_to admin_product_image_url(@admin_product_image)
  end

  test "should destroy admin_product_image" do
    assert_difference('Admin::ProductImage.count', -1) do
      delete admin_product_image_url(@admin_product_image)
    end

    assert_redirected_to admin_product_images_url
  end
end
