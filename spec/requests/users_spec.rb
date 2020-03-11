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

	describe 'POST/purchases' do
		context 'when request is valid' do
			before{post'/purchases', params: purchase_attributes.merge!(user_id: user.id, video_content_id: movie.id) }

			it 'creates a purchase' do
				expect(json['data']['video_quality']).to eq('HD')
			end

			it 'returns ststua code 201' do
				expect(response).to have_http_status(201)
			end 
		end

		context 'when request is invalid' do
			before{post'/purchases', params: purchase_attributes.merge!(user_id: nil)}
			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end

			it 'returns a validation erro message' do
				expect(response.body).to match(/Validation failed: User cannot be blank/)
			end
		end
	end
end