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
	validates_presence_of :price
  belongs_to :video_content
  belongs_to :user
	validate :validate_purchase

  scope :available_videos, -> {where("created_at > ?", 3.days.ago)}

  def validate_purchase
   	video = user.purchases.where(video_content_id: self.video_content_id).last
   	if video.present? && (video.created_at + 3.days) < DateTime.now
   		return true
   	elsif video.nil?
   		return true
   	else
    	errors.add(:purchase, "Sorry, the #{self.video_content.type} you are trying to purchase is already exist.")
    end
  end
end
