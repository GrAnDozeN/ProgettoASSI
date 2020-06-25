
class MusicController < ApplicationController
	skip_before_action :verify_authenticity_token
	require 'net/http'
	require 'base64'
	require 'json'

	def index
		if (params[:search] && params[:search]!= "")

			if (params[:type] == "Title")
				@musics = Music.where(title: params[:search])
			elsif (params[:type] == "Artist")
				@musics = Music.where(author: params[:search])
			elsif (params[:type] == "Album")
				@musics = Music.where(album: params[:search])
			elsif (params[:type] == "Year")
				@musics = Music.where(Year: params[:search])
			end

		else
			@musics = Music.all
		end

		if (params[:sort])
			@musics = @musics.order(params[:sort])
		end

	end


	def create
		if !(Music.exists?(:title=>params[:music][:title], :author=>params[:music][:author], :genre=>params[:music][:genre], :year=>params[:music][:year]))

			uri = URI ('https://api.spotify.com/v1/search')
			http = Net::HTTP.new(uri.host, uri.port)
			@tok_spotify = getToken

			header_auth = "Bearer " + @tok_spotify
			http.use_ssl=true
			data = {
				:q => "album:" + params[:music][:album] + " artist:" + params[:music][:author] + " track:" + params[:music][:title],
				:type => "track",
				:market => "US"
			}			
			uri.query = URI.encode_www_form(data).gsub("+","%20")
			request = Net::HTTP::Get.new(uri, {'Authorization' => header_auth})
			@response = http.request(request)
			
			#if (@response.code == 400)
			#	$tok_spotify = getToken
			#	header_auth = "Bearer " + $tok_spotify
			#	request = Net::HTTP::Get.new(uri, {'Authorization' => header_auth})
			#	@response = http.request(request)
			#end

			@response = JSON.parse(@response.body)
			
			if (@response["tracks"]["total"] == 0)
				@album = "https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg"
			else
				@album = @response["tracks"]["items"][0]["album"]["images"][0]["url"]
				@id_music = @response["tracks"]["items"][0]["id"]
			end


			#authorize! :create, @music, :message => "Attenzione: Non sei autorizzato a creare nuovi brani"
			params[:music].merge!(user_id: current_user.id)

			@music = Music.create!(params[:music].permit(:title,:author,:album,:genre,:year, :user_id))
			@music.update_attribute(:image_url, @album)
			@music.update_attribute(:preview_id, @id_music)
			
			#@music.update_attribute(:User_id, current_user.id)

			
			redirect_to music_path(@music)
		else
			redirect_to music_index_path
		end
	end


	def show
        id = params[:id]
        if Music.exists?(id)
			@music = Music.find(id)
			@reviews = Review.where(:music_id=>id)
        else
        	render html: 'Track does not exit'
        end
	end


	def new
		if !user_signed_in?
			redirect_to new_user_session_path()
		end
	end


	def destroy
		id = params[:id]
		@music = Music.find(id)
		authorize! :destroy, @music, :message => "Attenzione: Non sei autorizzato ad eliminare brani"
		@music.destroy
		redirect_to music_index_path
	end


	def update
        id = params[:id]
		@music = Music.find(id)
		authorize! :update, @music, :message => "Attenzione: Non sei autorizzato ad aggiornare brani"
		@music.update_attributes!(params[:music].permit(:title, :author, :album, :genre, :year))
		
		#	Cambio Album Cover + ID per preview Spotify
		uri = URI ('https://api.spotify.com/v1/search')
		http = Net::HTTP.new(uri.host, uri.port)
		@tok_spotify = getToken
		header_auth = "Bearer " + @tok_spotify
		http.use_ssl=true
		data = {
			:q => "album:" + params[:music][:album] + " artist:" + params[:music][:author] + " track:" + params[:music][:title],
			:type => "track",
			:market => "US"
		}			
		uri.query = URI.encode_www_form(data).gsub("+","%20")
		request = Net::HTTP::Get.new(uri, {'Authorization' => header_auth})
		@response = http.request(request)
		@response = JSON.parse(@response.body)
		
		if (@response["tracks"]["total"] == 0)
			@album = "https://img.bhs4.com/2a/0/2a05500a3a3ef626426fbca6efb69017863992af_large.jpg"
		else
			@album = @response["tracks"]["items"][0]["album"]["images"][0]["url"]
			@id_music = @response["tracks"]["items"][0]["id"]
		end
		@music.update_attribute(:image_url, @album)
		@music.update_attribute(:preview_id, @id_music)

		redirect_to music_path(@music)
	end
	

	def edit
		if !user_signed_in?
			redirect_to new_user_session_path()
		end

		id = params[:id]
		@music = Music.find(id)
		authorize! :update, @music
	end


	def getToken
		uri = URI ('https://accounts.spotify.com/api/token')
		http = Net::HTTP.new(uri.host, uri.port)
		header_auth = " Basic " + Base64.urlsafe_encode64("Bacbe321123644efbdd35e77e70c029e:9d42a8f197074ed4a42b7de3cfda059c")
		data = {
			:grant_type => "client_credentials"
		}
		request = Net::HTTP::Post.new(uri, {'Authorization' => header_auth})
		request.body = URI.encode_www_form(data)
		http.use_ssl=true
		@response = http.request(request)
		return JSON.parse(@response.body)["access_token"]
	end

	def music_params
		params.require(:music).permit(:title, :music_id, :search)
	end
end

