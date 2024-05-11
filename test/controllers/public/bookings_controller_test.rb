require "test_helper"

class Public::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_bookings_new_url
    assert_response :success
  end

  test "should get confirm" do
    get public_bookings_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get public_bookings_thanks_url
    assert_response :success
  end

  test "should get index" do
    get public_bookings_index_url
    assert_response :success
  end

  test "should get show" do
    get public_bookings_show_url
    assert_response :success
  end
end
