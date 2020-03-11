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
class Purchase < ApplicationRecord
	validates_presence_of :price, :video_quality
  belongs_to :video_content
  belongs_to :user
end
