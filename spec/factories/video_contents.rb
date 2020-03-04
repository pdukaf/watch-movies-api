FactoryBot.define do
	factory :video_content_movies do |f|
		f.title { Faker::Name.name }
		f.plot { 1 }
		f.type {"Movie"}
	end

	factory :video_content_seasons do |f|
		f.title {Faker::Name.name}
		f.plot {2}
		f.type {"Season"}
	end
end