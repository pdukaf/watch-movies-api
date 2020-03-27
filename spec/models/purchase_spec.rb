# == Schema Information
#
# Table name: purchases
#
#  id               :bigint           not null, primary key
#  price            :decimal(3, 2)    default("2.99")
#  video_quality    :string
#  voucher_number   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#  video_content_id :bigint           not null
#  voucher_id       :integer
#
# Indexes
#
#  index_purchases_on_user_id           (user_id)
#  index_purchases_on_video_content_id  (video_content_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (video_content_id => video_contents.id)
#
require 'rails_helper'

RSpec.describe Purchase, type: :model do

	let!(:movie) do
		FactoryBot.create :video_content_movie
	end

	let!(:user) do 
		FactoryBot.create :user
	end

	let!(:new_user) do
		FactoryBot.create :user_1
	end

	let!(:purchase) do
		FactoryBot.create :valid_purchase, user_id: user.id, video_content_id: movie.id
	end

	let!(:purchase_attributes) do 
		FactoryBot.attributes_for :valid_purchase
	end

	let!(:existing_purchase) do
		FactoryBot.create :past_purchase, user_id: new_user.id, video_content_id: movie.id
	end

	it 'error message while creating purchase.' do
		invalid_purchase = Purchase.new(purchase_attributes.merge!(user_id: user.id, video_content_id: movie.id))
		invalid_purchase.valid?
		expect(invalid_purchase.errors.messages[:purchase]).to include("Sorry, the Movie you are trying to purchase is already exist.")

	end

	it 'should validate the purchase which was created before 3 days.' do
		new_purchase = Purchase.new(purchase_attributes.merge!(user_id: new_user.id, video_content_id: movie.id))
		new_purchase.valid?
		expect(new_purchase).to be_valid
	end
end
