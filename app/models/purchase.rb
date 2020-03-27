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
class Purchase < ApplicationRecord
  belongs_to :voucher, optional: true
	validates_presence_of :price
  belongs_to :video_content
  belongs_to :user
	validate :validate_purchase, :check_voucher
  after_create :update_purchase
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

  def check_voucher
    if self.voucher_number.present?
      entered_voucher = Voucher.find_by_voucher_number(self.voucher_number)
      if entered_voucher.present? && entered_voucher.used == false
        return true
      else
        errors.add(:purchase, "Sorry, the voucher number you have entered doesnot valid.")
      end
    else
      return true      
    end
  end

  def update_purchase
    if self.voucher.present?
      voucher = Voucher.find_by_voucher_number(self.voucher_number)
      self.update(voucher_id: voucher.id)
      voucher.update(used: true)
    end
  end
end
