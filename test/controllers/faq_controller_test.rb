require 'test_helper'

class FaqControllerTest < ActionDispatch::IntegrationTest
  test "should get faq" do
    get faq_faq_url
    assert_response :success
  end

end
