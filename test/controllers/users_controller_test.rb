require "test_helper"

class UsersControllerTest < ActionController::TestCase
  test "can view a form for a new user" do
    get :new
    # check that there is an instance variable for empty user
    assert_instance_of(assigns(:user), User)
    # render the new template
    assert_template :new
    # check that response is 200 OK
    assert_response :ok
  end
end
