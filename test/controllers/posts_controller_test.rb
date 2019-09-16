require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
  	@post = posts(:one)
  	@other_post = posts(:two)
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get show" do
    get post_path(@post)
    assert_response :success
  end

end
