require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @params = {
      email: 'uniqueuser@tmsg.io',
      first_name: 'Andrew',
      last_name: 'Test',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  test 'a user with valid params is created' do
    user = User.new(@params)
    assert user.valid?
    assert_difference('User.count') do
      user.save
    end
  end

  test 'a user with invalid params is not created' do
    user = User.new(@params.except(:email))
    assert_not user.valid?
    assert_no_difference('User.count') do
      user.save
    end
  end

  test 'a user can update their first or last name' do
    @user = users(:default)
    assert_not_equal @user.first_name, 'New'
    assert_not_equal @user.last_name, 'New'
    @user.update(first_name: 'New', last_name: 'New')
    assert_equal @user.first_name, 'New'
    assert_equal @user.last_name, 'New'
  end
end
