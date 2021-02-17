require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "should be able to create a category successfully" do
    get new_category_path
    assert_response :success

    assert_difference('Category.count', 1) do
      post categories_path, params: { category: { title: 'Sports' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Sports', response.body
  end
end
