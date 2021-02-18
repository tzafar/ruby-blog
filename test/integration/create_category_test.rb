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

  test "should be able to show errors when empty title is submitted" do
    get new_category_path
    assert_response :success

    assert_no_difference('Category.count') do
      post categories_path, params: { category: { title: '' } }
    end
    assert_match 'errors', response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

  test "should not create duplicate categories" do
    get new_category_path
    assert_response :success

    category_name = 'Sports'
    Category.create(title: category_name)
    post categories_path, params: { category: { title: category_name } }

    assert_match 'Category name already exists', response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
