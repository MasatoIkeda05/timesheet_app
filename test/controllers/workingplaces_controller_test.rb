require "test_helper"

class WorkingplacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get workingplaces_new_url
    assert_response :success
  end
end
