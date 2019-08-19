require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  DatabaseCleaner.clean

  describe "GET index" do
    it "assigns @users" do
      user = User.create!(password: "123")
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

end
