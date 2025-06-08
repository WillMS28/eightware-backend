require 'rails_helper'

RSpec.describe "Auth", type: :request do
  let(:user_params) do
    {
      user: {
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }
  end

  describe "POST /signup" do
    it "creates a new user and returns JWT" do
      post "/signup", params: user_params

      expect(response).to have_http_status(:created)
      expect(response.headers['Authorization']).to be_present
      json = JSON.parse(response.body)
      expect(json['email']).to eq("test@example.com")
    end
  end

  describe "POST /login" do
    before do
      User.create!(email: "test@example.com", password: "password", password_confirmation: "password")
    end

    it "authenticates user and returns JWT" do
      post "/login", params: { user: { email: "test@example.com", password: "password" } }

      expect(response).to have_http_status(:ok)
      expect(response.headers['Authorization']).to be_present
      json = JSON.parse(response.body)
      expect(json['email']).to eq("test@example.com")
    end
  end
end
