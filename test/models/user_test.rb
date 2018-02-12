require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # special setup method automatically gets run before each test.
  #   Because @user is an instance variable, it’s automatically available 
  #   in all the tests, and we can test its validity using the valid? method
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
    password: "foobar", password_confirmation: "foobar")
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
  
  # test uniqueness of email addresses
  # for uniqueness tests we actually need to put a record into the database.
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
end
