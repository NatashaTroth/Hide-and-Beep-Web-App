# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :redirect_unauthorized_users, :only => [:privacy_policy]
  def home; end

  def help; end

  def privacy_policy; end

end
