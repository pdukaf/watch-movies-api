class SerializableSeason < JSONAPI::Serializable::Resource
	type "season"
	has_many :episodes do
		data do
			episodes = @object&.episodes.order(:id)
		end
	end
	attributes :id, :title, :plot, :number, :created_at
end