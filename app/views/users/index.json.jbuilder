json.array!(@users) do |user|
  json.extract! user, :id, :login, :password_digest, :email, :role
  json.url user_url(user, format: :json)
end
