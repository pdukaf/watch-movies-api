Rails.application.routes.draw do

	get '/movies', to: "video_contents#movies_list"
end
