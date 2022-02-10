require 'rails_helper'

RSpec.describe "gardens/new", type: :view do
  current_user = User.first_or_create(
    email: 'testing@testing.com',
    first_name: 'first',
    last_name: 'last',
    password: 'testing',
    password_confirmation: 'testing'
  )

  before(:each) do
    assign(:garden, Garden.new(
      title: 'title',
      address: 'address',
      price: 1,
      user: current_user,
      description: 'description'
    ))
  end

  it "renders new garden form" do
    render

    assert_select "form[action=?][method=?]", gardens_path, "post" do

      assert_select "input[name=?]", "garden[title]"

      assert_select "input[name=?]", "garden[address]"

      assert_select "input[name=?]", "garden[price]"

      assert_select "textarea[name=?]", "garden[description]"

    end
  end
end
