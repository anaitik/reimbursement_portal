require 'securerandom'

class LoginController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Sign in the user
      session_id = SecureRandom.uuid
      session[:user_id] = user.id

      response.set_cookie(
        :_session_id,
        {
          value: session_id,
          expires: 1.week.from_now,
          httponly: true,
          secure: Rails.env.production?
        }
      )

      render status: :ok, json: {
        message: 'Login successful',
        session_id: session_id
      }
    else
      render status: :unauthorized, json: { error: 'Invalid email or password' }
    end
  end
end
