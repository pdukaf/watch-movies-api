class SerializableEpisode < JSONAPI::Serializable::Resource
	type "episode"
	belongs_to :season
	attributes :id, :plot, :title, :total_no_of_episode, :created_at
end