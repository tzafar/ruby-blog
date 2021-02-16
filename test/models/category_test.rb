require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "category should not have empty title" do
    category = Category.new({ title: '' })
    assert_not category.valid?
  end

  test 'category should not have less than 3 characters' do
    category = Category.new({ title: 'st' })
    assert_not category.valid?
  end

  test 'category should not have more than 12 characters' do
    category = Category.new({ title: 'SportsGalaSpecial' })
    assert_not category.valid?
  end

  test 'category should have the right length of characters' do
    category = Category.new({ title: 'Sports' })
    assert category.valid?
  end

  test 'category should only contains letters' do
    category = Category.new({ title: '123456' })
    assert_not category.valid?
  end
end
