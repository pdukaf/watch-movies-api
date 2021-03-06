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
	factory :movie do |f|
		f.title { Faker::Name.name }
		f.plot { 1 }
		f.type {"Movie"}
	end
end
