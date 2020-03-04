class VideoContentsController < ApplicationController

	def movies_list
		movies = Movie.all.order(:created_at)
		render jsonapi: movies
	end

	def seasons_list
		seasons = Season.all.order(:created_at)
		render jsonapi: seasons, include: [:episodes]
	end

	def list_movies_and_seasons
		movies_and_seasons = VideoContent.all.order(:created_at)
		render jsonapi: movies_and_seasons
	end
end
