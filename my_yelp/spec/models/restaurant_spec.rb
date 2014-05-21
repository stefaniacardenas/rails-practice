require 'spec_helper'

describe Restaurant do 
	it 'is not valid without a name' do 
		restaurant = Restaurant.new(name: nil) 
		expect(restaurant).to have(2).errors_on(:name)
	end

	it 'is not valid without an address' do 
		restaurant = Restaurant.new(address: nil) 
		expect(restaurant).to have(2).errors_on(:address)
	end

	it 'is not valid without a cuisine' do 
		restaurant = Restaurant.new(cuisine: nil) 
		expect(restaurant).to have(1).error_on(:cuisine)
	end

	it 'is not valid with an address that is too short' do 
		restaurant = Restaurant.new(address: '72') 
		expect(restaurant).to have(1).error_on(:address)
	end

	it 'is not valid unless name starts with uppercase letter' do 
		restaurant = Restaurant.new(name: 'wahaca') 
		expect(restaurant).to have(1).error_on(:name)
	end

end

describe '#average_rating' do

let(:restaurant) { Restaurant.create(name: 'Kabir', address: 'Rome', cuisine: 'Indian' )}
	
	it 'initially returns N/A' do 
		expect(restaurant.average_rating).to eq 'N/A'
	end

	context '1 review' do
		before { restaurant.reviews.create(rating: 3) }

		it 'returns the score of that review' do 
			expect(restaurant.average_rating).to eq 3
		end
	end

	context '> 1 reviews' do 
		before do 
			restaurant.reviews.create(rating: 3)
			restaurant.reviews.create(rating: 5)
		end

		it 'returns the score of that review' do
			expect(restaurant.average_rating).to eq 4
		end
	end

	context 'non-integer average' do 
		before do
			restaurant.reviews.create(rating: 2)
			restaurant.reviews.create(rating: 5)
		end

			it 'does not round up or down' do
			expect(restaurant.average_rating).to eq 3.5
		end
	end


end