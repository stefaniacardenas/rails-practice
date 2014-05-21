 require 'spec_helper'

describe 'writing reviews' do

 	before { Restaurant.create(name: 'Wahaca', address: 'Somewhere', cuisine: 'Mexican')}
  
  context 'with valid data' do
	  it 'adds the review to the restaurant' do
		  leave_review(4, 'Very good')
		  expect(current_path).to eq '/restaurants'
		  expect(page).to have_content('Very good') 
 		end
 	end

 # 	context 'with invalid data' do
	#   it 'displays an error' do
	# 	  visit '/restaurants'
	# 	  click_link 'Review Wahaca'

	# 	  fill_in 'Comments', with: 'V'
	# 	  click_button 'Leave Review'

	# 	  expect(page).to have_content('Invalid review') 
 # 		end
 # end

 	it 'calculates the average of reviews' do
 		leave_review(4, 'Very good')
 		leave_review(2, 'Nothing special!')

 		visit '/restaurants'
 		expect(page).to have_content 'Average rating: 3'

 	end

 	def leave_review(rating, comments)
 		visit '/restaurants'
 		click_link 'Review Wahaca'
		  fill_in 'Comments', with: comments
		  select rating.to_s, from: 'Rating'
		  click_button 'Leave Review'
 		end
 		
end