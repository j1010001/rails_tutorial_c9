require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # special setup method automatically gets run before each test.
  #   Because @user is an instance variable, it’s automatically available 
  #   in all the tests, and we can test its validity using the valid? method
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
end
