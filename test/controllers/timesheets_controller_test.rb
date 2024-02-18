require "test_helper"

class TimesheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get timesheets_home_url
    assert_response :success
  end

  test "should get index" do
    get timesheets_index_url
    assert_response :success
  end
end
