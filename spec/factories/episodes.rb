# == Schema Information
#
# Table name: episodes
#
#  id                  :bigint           not null, primary key
#  plot                :integer
#  title               :string
#  total_no_of_episode :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  season_id           :integer
#
FactoryBot.define do
	factory :episode do |f|
		f.title { Faker::Name.name }
		f.plot { 1 }
		f.total_no_of_episode {10}
		f.created_at {DateTime.now}
	end
end
