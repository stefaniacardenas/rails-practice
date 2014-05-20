class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurants = Restaurant.new
	end

	def create
		Restaurant.create({name: 'Wahaca', address: '72, Palatine Rd, London'})
		redirect_to '/restaurants'
	end
	
end
