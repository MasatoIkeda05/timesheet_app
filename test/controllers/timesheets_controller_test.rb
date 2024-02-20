require "test_helper"

def setup
  @base_title = "勤怠アプリ"
end

class TimesheetsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get timesheets_index_url
    assert_response :success
  end
end
