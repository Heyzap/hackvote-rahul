class Hack < ActiveRecord::Base
	validates :title,	presence: true
	validates :people,	presence: true
end
