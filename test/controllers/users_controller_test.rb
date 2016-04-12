require "test_helper"

class UsersControllerTest < ActionController::TestCase
  test "can view a form for a new user" do
    get :new
    # check that there is an instance variable for empty user
    assert_instance_of(User, assigns(:user))
    # render the new template
    assert_template :new
    # check that response is 200 OK
    assert_response :ok
  end

  test "can create a new user" do
    assert_difference("User.count") do
      post :create, {
             email: "foo@bar.baz",
             full_name: "Britton Stanhope Butler",
             password: "dumb example",
             password_confirmation: "dumb example",
             date_of_birth: DateTime.now
           }
    end
    assert_redirected_to root_path
  end

  test "bad user data redisplays the form" do
    post :create, { email: "cookies@are.great" }
    assert_template :new
    assert_not_nil assigns(:user)
  end
end
