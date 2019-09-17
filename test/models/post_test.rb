require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(title: "Title1", description: "sutumei", image: "image.jpeg")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "description should be present" do
    @post.description = "     "
    assert @post.valid?
  end

  test "title should not be too long" do
    @post.title = "a" * 26
    assert_not @post.valid?
  end

  test "description should not be too long" do
    @post.description = "a" * 256
    assert_not @post.valid?
  end
end