json.array! @hunts do |hunt|
    json.extract! hunt, :id, :name
end