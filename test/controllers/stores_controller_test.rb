require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get stores_resources_url
    assert_response :success
  end
end
