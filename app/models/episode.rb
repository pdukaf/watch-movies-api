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
class Episode < ApplicationRecord
end
