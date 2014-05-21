Rails.application.routes.draw do

  get 'reviews/new'

  resources :restaurants do 
  	resources :reviews
  end

end
