require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new catgeory form and create category" do
    get "/catgeories/new"
    assert_response :success
    assert_difference 'Catgeory.count', 1 do
      post categories_path, params: { category: { name: "Sports" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end
end
