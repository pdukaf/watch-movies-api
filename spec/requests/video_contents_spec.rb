require 'rails_helper'
RSpec.describe 'VideoContent API' do
	include RequestSpecHelper
	let!(:movies) {create_list(:video_content_movies, 10)}
	let(:movie_id){movies.first.id}
	let!(:seasons) {create_list(:video_content_seasons, 10)}
	let(:season_id) {seasons.first.id}

	describe 'GET/movies' do
		before {get'/movies'}
		context 'Gives back list of movies' do
			byebug
			expect(response).to have_http_status(200)
			expect(json['movies'].size).to eq(10)
		end
	end

	describe 'GET/seasons' do
		before {get'/seasons'}
		context 'Gives back list of seasons' do
			expect(response).to have_http_status(200)
			expect(json['seasons'].size).to eq(10)
		end
	end	
end