# app/helpers/application_helper.rb
module ApplicationHelper
    def logged_in?
      session[:user_id].present?
    end
  end
  