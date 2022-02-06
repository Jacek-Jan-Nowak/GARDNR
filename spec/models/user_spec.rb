require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has an email' do
    user = User.new(
      email: '',
      first_name: 'first',
      last_name: 'last',
      password: 'testing',
      password_confirmation: 'testing'
    )

    expect(user).to_not be_valid
    user.email = 'test@testing.com'
    expect(user).to be_valid
  end

  it 'has a first name' do
    user = User.new(
      email: 'test@testing.com',
      first_name: '',
      last_name: 'last',
      password: 'testing',
      password_confirmation: 'testing'
    )

    expect(user).to_not be_valid
    user.first_name = 'first'
    expect(user).to be_valid
  end

  it 'has a last name' do
    user = User.new(
      email: 'test@testing.com',
      first_name: 'first',
      last_name: '',
      password: 'testing',
      password_confirmation: 'testing'
    )

    expect(user).to_not be_valid
    user.last_name = 'last'
    expect(user).to be_valid
  end

  it 'has a password' do
    user = User.new(
      email: 'test@testing.com',
      first_name: 'first',
      last_name: 'last',
      password: '',
      password_confirmation: 'testing'
    )

    expect(user).to_not be_valid

    user.password = 'testing'
    expect(user).to be_valid
  end

  it 'password confirmation match a password' do
    user = User.new(
      email: 'test@testing.com',
      first_name: 'first',
      last_name: 'last',
      password: '1234',
      password_confirmation: 'testing'
    )

    expect(user).to_not be_valid
    
    user.password = 'testing'
    expect(user).to be_valid
  end

end