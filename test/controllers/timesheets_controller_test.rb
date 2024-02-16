require "test_helper"

class TimesheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get timesheets_new_url
    assert_response :success
  end

  test "should get create" do
    get timesheets_create_url
    assert_response :success
  end

  test "should get index" do
    get timesheets_index_url
    assert_response :success
  end
end
