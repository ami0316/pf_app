require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get mypage" do
    get public_customers_mypage_url
    assert_response :success
  end
end
