FactoryBot.define do
	factory :valid_purchase, class: Purchase do |f|
		f.price {2.99}
		f.video_quality {"HD"}
	end

	factory :invalid_purchase, class: Purchase do |f|
		f.price {10.99}
		f.video_quality {"No Quality"}
	end
end