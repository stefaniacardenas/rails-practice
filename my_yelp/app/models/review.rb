class Review < ActiveRecord::Base
	belongs_to :restaurant
	validates_inclusion_of :rating, required: true, :in => 1..5
end
	