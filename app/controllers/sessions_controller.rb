class SessionsController < Devise::SessionsController
    skip_before_action :redirect_unauthorized_users
end