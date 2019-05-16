class ApplicationController < ActionController::Base
    
   before_action :authenticate_user!, :redirect_unauthorized_users, :if => Proc.new {|c| c.request.format.html?}

    def redirect_unauthorized_users
        if !current_user
            redirect_to new_user_session_path, alert: 'You must login'
        end
    end
end
