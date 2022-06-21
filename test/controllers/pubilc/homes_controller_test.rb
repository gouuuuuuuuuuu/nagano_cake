require "test_helper"

class Pubilc::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get pubilc_homes_top_url
    assert_response :success
  end
end
