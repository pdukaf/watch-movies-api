require 'rails_helper'
RSpec.describe 'VideoContent API', type: :request do
	include RequestSpecHelper
	let!(:movies) {create_list(:video_content_movie, 10)}
	let(:movie_id){movies.first.id}
	let!(:seasons) {create_list(:video_content_season, 10)}
	let(:season_id) {seasons.first.id}

	describe 'GET/movies' do
		before {get'/movies'}
  	it 'returns movies' do
      expect(json).not_to be_empty
      expect(json["data"].size).to eq(10)
      expect(response).to have_http_status(200)
      expect(movies.first.created_at).to be < movies.last.created_at
    end
  end
end