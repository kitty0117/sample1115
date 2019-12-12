require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
        @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end 
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name=""
    assert_not @user.valid?
  end 
  
  test "email should be present" do
    @user.email=""
    assert_not @user.valid?
  end 
  
  test "name should not be too long" do
    @user.name="a"*51
    assert_not @user.valid?
  end 
  
  test "email should not be too long" do
    @user.email="a"*244+"@example.com"
    assert_not @user.valid?
  end 
  
  test "password should be present (nonblank)" do
    @user.password=@user.password_confirmation = ""*6
    assert_not @user.valid?
  end 
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end 
  
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end 
  end 
  
  
  
end
