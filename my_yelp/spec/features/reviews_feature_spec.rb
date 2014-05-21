 require 'spec_helper'

 describe 'writing reviews' do

 	before { Restaurant.create(name: 'Wahaca', address: 'Somewhere', cuisine: 'Mexican')}
  
	  it 'adds the review to the restaurant' do
	  visit '/restaurants'
	  click_link 'Review Wahaca'

	  fill_in 'Comments', with: 'Very good'
	  select '4', from: 'Rating'
	  click_button 'Leave Review'

	  expect(current_path).to eq '/restaurants'
	  expect(page).to have_content('Very good') 
 	end
end