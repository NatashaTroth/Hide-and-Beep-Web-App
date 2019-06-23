# frozen_string_literal: true

json.array! @hunts do |hunt|
  json.extract! hunt, :id, :name, :authentification_key
end
