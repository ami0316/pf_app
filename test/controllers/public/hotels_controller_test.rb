require "test_helper"

class Public::HotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_hotels_index_url
    assert_response :success
  end

  test "should get show" do
    get public_hotels_show_url
    assert_response :success
  end
end
