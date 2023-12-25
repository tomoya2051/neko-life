require "test_helper"

class Public::DiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get inex" do
    get public_diaries_inex_url
    assert_response :success
  end

  test "should get new" do
    get public_diaries_new_url
    assert_response :success
  end

  test "should get show" do
    get public_diaries_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_diaries_edit_url
    assert_response :success
  end
end
