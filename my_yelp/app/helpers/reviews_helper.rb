module ReviewsHelper

	def star_rating(value)

		return value unless value.respond_to?(:round)
		rounded = value.round

		filled_stars = '★' * rounded
		empty_stars = '☆' * (5 - rounded)		

		filled_stars + empty_stars
	end

end
