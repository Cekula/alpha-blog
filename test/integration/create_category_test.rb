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

  test "get new catgeory form and reject invalid category submission" do
    get "/catgeories/new"
    assert_response :success
    assert_no_difference 'Catgeory.count' do
      post categories_path, params: { category: { name: " " } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

end
