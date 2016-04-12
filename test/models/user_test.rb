require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user passwords are encrypted" do
    password = "cookies"
    @user = User.new(email: "foo@bar.baz",
                     password: password)
    @user.save
    assert_not_nil @user.password_digest
    assert_not_equal password, @user.password_digest
  end

  test "users can't be saved without a password" do
    @user = User.new(email: "cookies@monster.whatever")
    refute @user.valid?
    @user.password = "lunchtime"
    assert @user.valid?
  end

  test "users can't be saved without an email" do
    @user = User.new(password: "dogs are great")
    refute @user.valid?
    @user.email = "some@email.example"
    assert @user.valid?
  end

  test "users with an invalid email are rejected" do
    @user = User.new(email: "stupid nonsense",
                     password: "taco lunch")
    refute @user.valid?
    @user.email = "this@is.okay"
    assert @user.valid?
  end

  test "users have many posts" do
    user = users(:brit)
    assert user.posts.count >= 0
    assert_equal user.posts.first, posts(:google)
  end
end
