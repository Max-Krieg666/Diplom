module StudentRatingElementsHelper
	def select_rating_element(rating_element, disc_id, selected = nil)
		rating = Discipline.find(disc_id).rating
		select_tag(rating_element, options_for_select(
			rating.rating_elements.map{ |x| [x.title, x.id] },
			  [selected]), id: 'choose-rating-element')
	end
end
