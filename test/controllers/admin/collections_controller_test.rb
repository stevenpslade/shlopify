require 'test_helper'

class Admin::CollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_collection = admin_collections(:one)
  end

  test "should get index" do
    get admin_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_collection_url
    assert_response :success
  end

  test "should create admin_collection" do
    assert_difference('Admin::Collection.count') do
      post admin_collections_url, params: { admin_collection: {  } }
    end

    assert_redirected_to admin_collection_url(Admin::Collection.last)
  end

  test "should show admin_collection" do
    get admin_collection_url(@admin_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_collection_url(@admin_collection)
    assert_response :success
  end

  test "should update admin_collection" do
    patch admin_collection_url(@admin_collection), params: { admin_collection: {  } }
    assert_redirected_to admin_collection_url(@admin_collection)
  end

  test "should destroy admin_collection" do
    assert_difference('Admin::Collection.count', -1) do
      delete admin_collection_url(@admin_collection)
    end

    assert_redirected_to admin_collections_url
  end
end
