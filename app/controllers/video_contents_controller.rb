class VideoContentsController < ApplicationController

	def movies_list
		movies = Movie.all.order(:created_at)
		render jsonapi: movies
	end
end
