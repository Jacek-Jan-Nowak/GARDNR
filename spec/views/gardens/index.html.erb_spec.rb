require 'rails_helper'

RSpec.describe "gardens/index", type: :view do
  current_user = User.first_or_create(
    email: 'testing@testing.com',
    first_name: 'first',
    last_name: 'last',
    password: 'testing',
    password_confirmation: 'testing'
  )

  before(:each) do
    assign(:gardens, [
      Garden.create!(
        title: 'title',
        address: 'address',
        price: 1,
        user: current_user,
        description: 'description'
    ),
      Garden.create!(
        title: 'title',
        address: 'address',
        price: 2,
        user: current_user,
        description: 'description'
    )
  ])
  end

  it "renders a list of gardens" do
    render
    assert_select "h3", text: "title".to_s, count: 2
    assert_select "h4", text: "address".to_s, count: 2
    assert_select "p", text: "description".to_s, count: 2

  end
end