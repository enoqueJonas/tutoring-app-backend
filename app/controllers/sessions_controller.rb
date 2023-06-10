class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      render json: { message: 'Logged In Successfully' }
    else
      render json: { message: 'Invalid Username' }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logged Out Successfully' }
  end
end
