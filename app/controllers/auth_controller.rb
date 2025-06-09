class AuthController < ApplicationController
  before_action :authenticate_user!, only: [:me]

  def signup
    user = User.new(signup_params)
    if user.save
      token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
      response.set_header('Authorization', "Bearer #{token}")
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_for_database_authentication(email: params.dig(:user, :email))

    if user&.valid_password?(params.dig(:user, :password))
      token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
      response.set_header('Authorization', "Bearer #{token}")
      render json: user, status: :ok
    else
      render json: { errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end

  def me
    render json: { email: current_user.email }, status: :ok
  end

  private

  def signup_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
