# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :redirect_unauthorized_users, only: %i[privacy_policy privacy_policy_app]

  def home; end

  def help; end

  def privacy_policy; end

  def privacy_policy_app; end
end
