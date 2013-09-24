require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should enter an email" do
    user = User.new
    assert !user.save
    assert !user.errors[:email].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:freddy).profile_name
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user shoud have a profile name without spaces" do
    user = User.new(first_name: 'Freddy', last_name: 'Liu', email: 'asd@asd.com')
    user.password = user.password_confirmation = 'asdasdasd'
    user.profile_name = 'fredex 123'
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly")
  end

  test "a user should have a correctly formatted profile name" do
    user = User.new(first_name: 'Freddy', last_name: 'Liu', email: 'asd@asd.com')
    user.password = user.password_confirmation = 'asdasdasd'
    user.profile_name = 'fredex123'
    assert user.valid?
  end

end
