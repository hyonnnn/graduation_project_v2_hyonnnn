require "test_helper"

class PositiveMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get positive_messages_show_url
    assert_response :success
  end
end
