class Music < ApplicationRecord

	has_many :reviews

	has_many :favorites
	has_many :users, :through => :favorites


	def self.search(search)
		if search
			track = Music.find_by(title: search)
				if track
					self.where(music_id: track)
				else 
					@tracks = Music.all
				end
			else
				@tracks = Music.all
			end
		end

end
