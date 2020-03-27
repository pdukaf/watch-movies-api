# == Schema Information
#
# Table name: purchases
#
#  id               :bigint           not null, primary key
#  price            :decimal(3, 2)    default("2.99")
#  video_quality    :string
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
FactoryBot.define do
	factory :valid_purchase, class: Purchase do |f|
		f.price {2.99}
		f.video_quality {"HD"}
	end

	factory :invalid_purchase, class: Purchase do |f|
		f.price {10.99}
		f.video_quality {"No Quality"}
	end

	factory :past_purchase, class: Purchase do |f|
		f.price {2.99}
		f.video_quality {"SD"}
		f.created_at {DateTime.now - 3.days}
	end
end
