# == Schema Information
#
# Table name: video_contents
#
#  id         :bigint           not null, primary key
#  number     :integer
#  plot       :integer
#  title      :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
	factory :video_content_movie, class: VideoContent do |f|
		f.title { Faker::Name.name }
		f.plot { 1 }
		f.type {"Movie"}
		f.created_at {DateTime.now}
	end

	factory :video_content_season, class: VideoContent do |f|
		f.title {Faker::Name.name}
		f.plot {2}
		f.type {"Season"}
		f.number {Faker::Number.number(digits: 2)}
		f.created_at {DateTime.now}
	end
end
