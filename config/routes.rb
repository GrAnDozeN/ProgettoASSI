Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#get ('music') => redirect('/')
	#post ('/music/:id') => "music#update"
	#post ('/music/new') => "music#create"
	#get '/callback' => "sessions#create"
	#get '/login' => "sessions#login"
	#get '/logout' => "sessions#destroy"
	#map.connect '/auth/:provider', :controller => :authentications, :action => :blank
	resources :music do
		resources :reviews
	end
	devise_for :user, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	scope module: :music do
		resource :favorite, only: [:show, :update, :destroy]
	end

	get '' => redirect("/music")
	resources :user, only:  [:index, :show, :destroy, :update]

	get '/about' => "other#about"
	get '/contact' => "other#contact"
	post '/contact' => "other#sendMail"
end
