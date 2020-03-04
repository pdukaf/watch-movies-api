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
class Season < VideoContent
end
