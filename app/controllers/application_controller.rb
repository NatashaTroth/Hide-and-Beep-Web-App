# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :redirect_unauthorized_users, if: proc { |c| c.request.format.html? }


  def redirect_unauthorized_users
    redirect_to new_user_session_path, alert: 'You must login' unless current_user 
  end
end
