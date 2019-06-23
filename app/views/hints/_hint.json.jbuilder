# frozen_string_literal: true

json.extract! hint, :id, :position, :longitude, :latitude, :text, :hunt_id, :location_name, :created_at, :updated_at
json.url hint_url(hint, format: :json)
