class Review < ActiveRecord::Base
	belongs_to :music
	belongs_to :musicgoer
end
