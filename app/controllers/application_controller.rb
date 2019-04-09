class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    # after protect_from_forgery with: :exception
end
