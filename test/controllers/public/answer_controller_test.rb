require "test_helper"

class Public::AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_answer_new_url
    assert_response :success
  end
end
