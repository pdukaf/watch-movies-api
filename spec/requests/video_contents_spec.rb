require 'rails_helper'
RSpec.describe 'VideoContent API', type: :request do
	include RequestSpecHelper
	let!(:movies) {create_list(:video_content_movie, 10)}
	let!(:seasons) {create_list(:video_content_season, 10)}
	let(:season_id) {seasons.first.id}
	let!(:episode) do
    FactoryBot.create :episode, season_id: season_id
  end
	describe 'GET/movies' do
		before {get'/movies'}
  	it 'return all movies' do
      expect(json).not_to be_empty
      expect(json["data"].size).to eq(10)
      expect(response).to have_http_status(200)
      expect(movies.first.created_at).to be < movies.last.created_at
    end
  end

  describe 'GET/seasons' do
  	before {get'/seasons'}
  	it 'return all sesons' do
  		expect(json).not_to be_empty
  		expect(response).to have_http_status(200)
  		expect(seasons.first.created_at).to be < seasons.last.created_at
      expect(json['data'].first).to include("relationships")
  	end
  end
end