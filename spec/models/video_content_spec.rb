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
require 'rails_helper'

RSpec.describe VideoContent, type: :model do
  it { should validate_presence_of(:title) }
	it { should validate_presence_of(:plot) }
	it "is not valid without title" do 
		movie = Movie.new(title: nil)
		expect(movie).to_not be_valid
	end

	it "is not valid without plot" do
		season = Season.new(plot:nil)
		expect(season).to_not be_valid
	end

	it "should be valid with title and plot for movie" do 
		movie = Movie.new(title: "Avengers", plot: 1)
		expect(movie).to be_valid
	end

	it 'should be valid with title, plot and number for season' do
		season = Season.new(title: "Breaking Bad", plot: 2, number: 2)
		expect(season).to be_valid
	end
end
