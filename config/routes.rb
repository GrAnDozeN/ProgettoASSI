Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#get ('music') => redirect('/')
	#post ('/music/:id') => "music#update"
	#post ('/music/new') => "music#create"
	get '/callback' => "sessions#create"
	get '/login' => "sessions#login"
	get '/logout' => "sessions#destroy"
	resources :music do
		resources :reviews
	end
end
