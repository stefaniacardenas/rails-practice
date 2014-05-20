class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create 
		@restaurant = Restaurant.new(params["restaurant"].permit(:name, :address, :cuisine))

		if @restaurant.save
			redirect_to '/restaurants'
		else
			render 'new'
		end  

	end

	def edit
		@restaurant = Restaurant.find(params[:id])		
	end
 
	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(params[:restaurant].permit(:name, :address, :cuisine))
			 redirect_to '/restaurants'
		else
			render 'edit'
	end
end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
 
		flash[:notice] = 'Deleted successfully!'
		redirect_to '/restaurants'
	end
	
end
