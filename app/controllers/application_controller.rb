# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :redirect_unauthorized_users

  def redirect_unauthorized_users
    unless current_user
      redirect_to new_user_session_path, alert: 'You must login'
    end
  end
end
