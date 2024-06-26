require "test_helper"

class Admin::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_bookings_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_bookings_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_bookings_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bookings_edit_url
    assert_response :success
  end
end
