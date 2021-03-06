require 'rails_helper'

RSpec.describe 'Users API', type: :request do
	include RequestSpecHelper
	let!(:movie) do
		FactoryBot.create :video_content_movie
	end

	let!(:user) do
		FactoryBot.create :user
	end

	let!(:purchase_attributes) do 
		FactoryBot.attributes_for :valid_purchase
	end

	describe 'POST/users/:id/purchases' do
		context 'when request is valid' do
			before{post"/users/#{user.id}/purchases", params: {purchase: purchase_attributes.merge!(video_content_id: movie.id) }}

			it 'creates a purchase' do
				expect(json['data']['attributes']['video_quality']).to eq('HD')
			end

			it 'returns http status code 201' do
				expect(response).to have_http_status(201)
			end 
		end

		context 'when request is invalid' do
			before{post"/users/#{user.id}/purchases", params: {purchase: purchase_attributes.merge!(video_content_id: nil)}}
			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end

			it 'returns a validation erro message' do
				expect(json['errors'].first['detail']).to eq('Video content must exist')
			end
		end
	end

	describe 'GET/users/:id/library' do
		before {get"/users/#{user.id}/library"}
		it 'returns all movies and seasons purchased by user' do
			expect(response).to have_http_status(200)
		end
	end
end