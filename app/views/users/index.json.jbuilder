json.array!(@users) do |user|
  json.extract! user, :id, :username, :nickname, :url
  json.url user_url(user, format: :json)
end
