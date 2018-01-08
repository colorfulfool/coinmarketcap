require 'test_helper'

class CoinsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/"
    assert_response :ok
  end
end
