class Restaurant < ActiveRecord::Base
	validates :name, presence: true, format: { with: /\A[A-Z]/, message: 'must begin with capital letter' }
	validates :address, presence: true, length: {minimum: 3} 
	validates :cuisine, presence: true
	has_many :reviews

	def average_rating
		if reviews.any?
			# reviews.inject(0) { | total, review |
			# 	total + review.rating 
			# 	} / reviews.count.to_f
			reviews.average(:rating)
			# this is a  built-in method in rails
		else
			'N/A'
		end
	end

end
