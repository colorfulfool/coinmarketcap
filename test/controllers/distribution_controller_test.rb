require 'test_helper'

class DistributionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get distribution_new_url
    assert_response :success
  end

end
