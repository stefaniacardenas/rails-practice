require 'spec_helper.rb'

	describe "restaurant index page" do 
		context 'when there are no restaurants'
		
		it 'should show a message' do 
			visit '/restaurants'
			expect(page).to have_content('No restaurants added yet!')
		end
	end

	describe "creating a restaurant" do

		context 'with valid data' do
			it 'should add a restaurant to the index' do 
				visit '/restaurants/new'
				fill_in 'Name', with: 'Wahaca'
				fill_in 'Address', with: '72, Palatine Rd, London'
				fill_in 'Cuisine', with: 'Mexican'
				click_button 'Create Restaurant'

				expect(current_path).to eq '/restaurants'
				expect(page).to have_content 'Wahaca'
			end
		end

		context 'with invalid data' do
			it 'shows an error' do 
			visit '/restaurants/new'
			fill_in 'Name', with: 'wahaca'
			fill_in 'Address', with: '72 '
			fill_in 'Cuisine', with: 'Mexican'
			click_button 'Create Restaurant'

			expect(page).to have_content 'errors'
			end
		end

	end

	describe 'editing a restaurant' do
		before { Restaurant.create(name: 'Thai Veg', address: '1, Essex Rd - London', cuisine: 'Thai')}

		it 'saves the change to the restaurant' do
			visit '/restaurants'
			click_link 'Edit Thai Veg'

			fill_in 'Name', with: 'Thai Vegetarian Restaurant'
			click_button 'Update Restaurant'

			expect(current_path).to eq '/restaurants'
			expect(page).to have_content('Thai Vegetarian Restaurant')
		end
	end

	describe 'deleting a restaurant' do 
		before { Restaurant.create(name: 'Whatever', address: 'Somewhere in London', cuisine: 'Stuff') }

		it 'removes the restaurant from the listing' do 
			visit	'/restaurants'
			click_link 'Delete Whatever'

			expect(page).not_to have_content 'Whatever'
			expect(page).to have_content 'Deleted successfully!'
	end 
end

