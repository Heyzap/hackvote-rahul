class Hackday < ActiveRecord::Base
	has_many :hacks
	validates :name, presence: true
end
