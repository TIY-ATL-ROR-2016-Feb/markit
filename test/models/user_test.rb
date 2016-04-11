require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user passwords are encrypted" do
    password = "cookies"
    @user = User.new(email: "foo@bar.baz",
                     password: password)
    @user.save
    assert_nil @user.password
    assert_not_nil @user.password_digest
    assert_not_equal password, @user.password_digest
  end
end
