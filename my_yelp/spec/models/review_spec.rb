require 'spec_helper'

describe Review do
	it 'is invalid if rating is > 5' do 
		review = Review.new(rating: 7)
		expect(review).to have(1).error_on(:rating)
	end

	it 'is invalid if the rating is < 1' do
		review = Review.new(rating: 0)
		expect(review).to have(1).error_on(:rating)
	end


end

