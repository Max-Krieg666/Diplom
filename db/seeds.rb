# загрузка групп
YAML.load_file(Rails.root.join('db', 'seeds', 'groups.yml')).each do |g|
	Group.create!(g)
end

# загрузка пользователей
YAML.load_file(Rails.root.join('db', 'seeds', 'users.yml')).each do |u|
	User.create!(u)
end

# загрузка дисциплин и создание рейтингов к ним
YAML.load_file(Rails.root.join('db', 'seeds', 'disciplines.yml')).each do |d|
	tmp = Discipline.create(d)
  r = Rating.create(discipline_id: tmp.id)
	tmp.rating_id = r.id
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

# создание элементов рейтинга
Rating.all.each do |r|
  RatingElement.create(title: 'Домашние работы', score: 20, rating_id: r.id)
	RatingElement.create(title: 'Тестирование', score: 10, rating_id: r.id)
  RatingElement.create(title: 'Посещаемость занятий', score: 30, rating_id: r.id)
	RatingElement.create(title: 'Работа на занятиях', score: 20, rating_id: r.id)
  RatingElement.create(title: 'Экзаменационная работа', score: 20, rating_id: r.id)
end

# # создание элементов рейтинга для каждого студента
# RatingElement.all.each do |re|
#   usrs = re.rating.discipline.group.users.where(role: 0)
#   usrs.each do |us|
#   	StudentRatingElement.create(user_id: us.id, rating_element_id: re.id)
#   end
# end