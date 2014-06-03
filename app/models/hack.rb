class Hack < ActiveRecord::Base
	belongs_to :hackday
	validates :title,	presence: true
	validates :people,	presence: true
end
