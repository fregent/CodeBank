require "test_helper"

class DirectoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get directories_new_url
    assert_response :success
  end
end
