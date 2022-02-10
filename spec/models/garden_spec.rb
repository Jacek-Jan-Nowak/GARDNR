require 'rails_helper'

RSpec.describe Garden, type: :model do
  current_user = User.new(
    email: 'testing@testing.com',
    first_name: 'first',
    last_name: 'last',
    password: 'testing',
    password_confirmation: 'testing'
  )


  it 'has a title' do
    garden = Garden.new(
      title: '',
      address: 'address',
      price: 1,
      user: current_user,
      description: 'description'
    )

    expect(garden).to_not be_valid
    garden.title = 'title'
    expect(garden).to be_valid
  end

  it 'has an address' do
    garden = Garden.new(
      title: 'title',
      address: '',
      price: 1,
      user: current_user,
      description: 'description'
    )

    expect(garden).to_not be_valid
    garden.address = 'address'
    expect(garden).to be_valid
  end

  
  it 'has a price' do
    garden = Garden.new(
      title: 'title',
      address: 'address',
      price: '',
      user: current_user,
      description: 'description'
    )

    expect(garden).to_not be_valid
    garden.price = 1
    expect(garden).to be_valid
  end
end