# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :redirect_unauthorized_users
end
