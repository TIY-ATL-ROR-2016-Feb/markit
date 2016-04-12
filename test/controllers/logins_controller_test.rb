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

  test "user tries to login with an invalid email" do
    post :create, {
           email: "nonsense-bullshit",
           password: "stuff"
         }
    assert_template :new
    assert_nil session[:user_id]
    assert_includes flash[:notice], "Invalid "
  end

  test "can display a login form" do
    get :new
    assert_response :ok
    assert_template :new
  end

  test "a user can logout" do
#    sign_in(users(:brit))
    delete :destroy
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end
