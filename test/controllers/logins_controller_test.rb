require "test_helper"

class LoginsControllerTest < ActionController::TestCase

  test "a valid email and password logs in" do
    post :create, {
           email: users(:brit).email,
           password: "cookies"
         }
    assert_equal session[:user_id], users(:brit).id
    assert_redirected_to root_path
  end

  test "invalid password re-renders the form" do
    post :create, {
           email: users(:brit).email,
           password: "wrong-password"
         }
    assert_nil session[:user_id]
    assert_template :new
  end

  test "can display a login form" do
    get :new
    assert_response :ok
    assert_template :new
  end
end
