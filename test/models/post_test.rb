require 'test_helper'

class PostTest < ActiveSupport::TestCase

  # test "can create a basic post" do
  #   @post = Post.new(user_id: users(:brit).id,
  #                    title: "awesome cats",
  #                    link_url: "http://http://i.imgur.com/2Hnwn3eg.jpg")
  #   assert @post.save
  # end

  test "posts must have a user_id" do
    @post = Post.new(title: "awesome cats",
                     link_url: "google.com")
    refute @post.valid?, "saved without a user_id"
  end

  test "posts have a user" do
    post = posts(:google)
    assert_equal post.user, users(:brit)
  end

  test "posts need a title and url" do
    @post = users(:brit).posts.new(title: "awesome cats")
    refute @post.valid?
    @post = users(:brit).posts.new(link_url: "google.com")
    refute @post.valid?
    @post.title = "awesome cats"
    assert @post.valid?
  end
end
