class VideoContentsController < ApplicationController

	def movies_list
		movies = Movie.all.order(:created_at)
		render jsonapi: movies
	end

	def seasons_list
		byebug
		seasons = Season.all.order(:created_at)
		render jsonapi: seasons, include: [:episodes]
	end
end
