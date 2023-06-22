class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      render json: { message: 'Logged In Successfully', user: user }
    else
      render json: { message: 'Invalid Username' }
    end
    Rails.logger.debug "Response Headers: #{response.headers.inspect}"
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logged Out Successfully' }
  end

  def logged_in
    if session[:user_id]
      user = User.find(session[:user_id])
      render json: { logged_in: true, user: user }
    else
      render json: { logged_in: false }
    end
    Rails.logger.debug "Session ID: #{session.id}"
    Rails.logger.debug "Session Data: #{session.to_hash}"
  end
end
