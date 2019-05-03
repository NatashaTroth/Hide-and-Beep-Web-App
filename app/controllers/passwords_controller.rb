# frozen_string_literal: true

class PasswordsController < Devise::PasswordsController
  skip_before_action :redirect_unauthorized_users
end
