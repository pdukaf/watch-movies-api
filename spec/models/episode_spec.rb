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
require 'rails_helper'

RSpec.describe Episode, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:plot)}
  it {should validate_presence_of(:total_no_of_episode)}
  it {should belong_to(:season)}
  it {should validate_presence_of(:season_id)}
end
