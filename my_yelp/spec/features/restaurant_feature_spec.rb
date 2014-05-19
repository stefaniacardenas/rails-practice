require 'spec_helper.rb'

	describe "restaurant index page" do 
		context 'when there are no restaurants'
		
		it 'should show a message' do 
			visit '/restaurants'
			expect(page).to have_content('No restaurants added yet!')
		end
	end

	describe "creating a restaurant" do 
		
		it 'should add a restaurant to the index' do 
			visit '/restaurants/new'
			fill_in 'Name', with: 'Wahaca'
			fill_in 'Address', with: '72, Palatine Rd, London'
			click_button 'Create Restaurant'

			expect(current_path).to eq '/restaurants/new'
			expect(page).to have_content 'Wahaca'
		end

	end

