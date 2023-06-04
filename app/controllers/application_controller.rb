class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    protect_from_forgery with: :null_session
    helper_method :current_user
    # before_action :authenticate_user_by_session_id

  private
  

#   def authenticate_user_by_auth_token
#     auth_token = params[:auth_token]
#     user = User.find_by(auth_token: auth_token)

#     unless user
#       render status: :unauthorized, json: { error: 'Invalid auth token' }
#     end
#   end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  end
  