YAML.load_file(Rails.root.join('db','seeds','groups.yml')).each do |g|
	Group.create!(g)
end

YAML.load_file(Rails.root.join('db','seeds','users.yml')).each do |u|
	User.create!(u)
end