# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
	factory :user do |f|
		f.email {"test@example.com"}
	end

	factory :user_1, class: User do |f|
		f.email {"hello2gmail.com"}
	end	
end
