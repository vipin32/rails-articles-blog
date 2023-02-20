require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @category = Category.new(name: 'sports')
  end

  test "should have valid category name" do
    assert @category.valid?
  end

  test "should not save category without name" do
    @category.name = ''
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save

    @category2 = Category.new(name: 'sports')
    assert_not @category2.valid?

  end

  test "name should not be too long" do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = 'aa'
    assert_not @category.valid?
  end

end
