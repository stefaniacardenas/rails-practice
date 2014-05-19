require 'spec_helper.rb'

describe "restaurant index page" do 
	context 'when there are no restaurants'
	
	it 'should show a message' do 
		visit '/restaurants'
		expect(page).to have_content('No restaurants added yet!')
	end

end

