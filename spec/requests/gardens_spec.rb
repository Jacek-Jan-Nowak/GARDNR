require 'rails_helper'


RSpec.describe "/gardens", type: :request do
  current_user = User.first_or_create(
    email: 'testing@testing.com',
    first_name: 'first',
    last_name: 'last',
    password: 'testing',
    password_confirmation: 'testing'
  )
  

  let(:valid_attributes) do 
    {
    'title' => 'title',
    'address' => 'address',
    'price' => 1,
    'description' => 'description',
    'user' => current_user,
    }
    end

  let(:invalid_attributes) do 
    {
    'title' => '',
    'address' => '',
    'price' => '',
    'description' => ''
    }
    end

  describe "GET /index" do
    it "renders a successful response" do
      garden = Garden.new(valid_attributes)
      garden.user = current_user
      garden.save
      get gardens_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      garden = Garden.new(valid_attributes)
      garden.user = current_user
      garden.save
      get garden_url(garden)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_garden_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      garden = Garden.new(valid_attributes)
      garden.user = current_user
      garden.save
      get edit_garden_url(garden)
      expect(response).to be_successful
    end
  end

  describe "garden /create" do
    context "with valid parameters" do
      it "creates new garden and redirects to the created garden" do

        garden = Garden.new(valid_attributes)
        garden.user = current_user
        garden.save
        post gardens_url, params: { garden: valid_attributes }
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
      it "does not create a new garden" do
        garden = Garden.new(invalid_attributes)
        garden.user = current_user
        garden.save
        get new_garden_url
        expect(response).to be_successful
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post gardens_url, params: { garden: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do {
        'title' => 'title2',
        'address' => 'address2',
        'price' => 2,
        'user' => current_user,
        'description' => 'description2'
      }
      end

      it "updates the requested garden" do
        garden = Garden.new(valid_attributes)
        garden.user = current_user
        garden.save
        patch garden_url(garden), params: { garden: new_attributes }
        garden.reload
      end

      it "redirects to the garden" do
        garden = Garden.new(valid_attributes)
        garden.user = current_user
        garden.save
        patch garden_url(garden), params: { garden: new_attributes }
        garden.reload
        expect(response).to redirect_to(garden_url(garden))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        garden = Garden.create! valid_attributes
        patch garden_url(garden), params: { garden: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested garden" do
      garden = Garden.new(valid_attributes)
      garden.user = current_user
      garden.save
      delete garden_url(garden)
      expect(response).to redirect_to(gardens_url)
    end
  end
end
