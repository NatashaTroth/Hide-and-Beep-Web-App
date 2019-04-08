json.extract! hunt, :id, :name, :start_date, :expiry_date, :set_time_limit, :no_time_limit, :winning_code, :created_at, :updated_at
json.url hunt_url(hunt, format: :json)
