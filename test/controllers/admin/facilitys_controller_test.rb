require "test_helper"

class Admin::FacilitysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_facilitys_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_facilitys_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_facilitys_edit_url
    assert_response :success
  end
end
