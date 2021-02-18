require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(title: 'Sports')
    @category1 = Category.create(title: 'Travel')
  end

  test "should be able to view list of categories" do
    get categories_url
    assert_match @category.title, response.body, "#{@category.title} not found in the page"
  end
end
