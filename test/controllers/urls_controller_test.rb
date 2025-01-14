require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get urls_index_url
    assert_response :success
  end

  test "should get show" do
    get urls_show_url
    assert_response :success
  end

  test "should get new" do
    get urls_new_url
    assert_response :success
  end

  test "should get create" do
    get urls_create_url
    assert_response :success
  end

  test "should get edit" do
    get urls_edit_url
    assert_response :success
  end

  test "should get update" do
    get urls_update_url
    assert_response :success
  end

  test "should get destroy" do
    get urls_destroy_url
    assert_response :success
  end
end
