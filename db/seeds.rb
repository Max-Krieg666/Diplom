YAML.load_file(Rails.root.join('db', 'seeds', 'groups.yml')).each do |g|
	Group.create!(g)
end

YAML.load_file(Rails.root.join('db', 'seeds', 'users.yml')).each do |u|
	User.create!(u)
end

YAML.load_file(Rails.root.join('db', 'seeds', 'disciplines.yml')).each do |d|
	tmp = Discipline.new(d)
  tmp.rating = Rating.create(max_score: 100)
  tmp.save!
  usrs = User.where(role: 1).to_a
  count = usrs.size
  r1 = rand(count)
	tmp.users << usrs[r1] # 1-й преподаватель
  if rand(30) > 14
		r2 = rand(count)
		while r1 == r2
			r2 = rand(count)
		end
		tmp.users << usrs[r2] # 2-й преподаватель
	end
end