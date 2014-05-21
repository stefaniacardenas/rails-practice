class Review < ActiveRecord::Base
	belongs_to :restaurant
	validates :comments, length: {minimum: 2}
	validates_inclusion_of :rating, :in => 1..5
end
