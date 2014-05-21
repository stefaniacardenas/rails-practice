class Restaurant < ActiveRecord::Base
	validates :name, presence: true, format: { with: /\A[A-Z]/, message: 'must begin with capital letter' }
	validates :address, presence: true, length: {minimum: 3} 
	validates :cuisine, presence: true
	has_many :reviews
end
