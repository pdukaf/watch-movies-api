Rails.application.routes.draw do

	get '/movies', to: "video_contents#movies_list"
	get '/seasons', to: "video_contents#seasons_list"
	get '/movies-seasons', to: "video_contents#list_movies_and_seasons"
end
