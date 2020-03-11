class SerializableMovie < JSONAPI::Serializable::Resource
	type "movie"
	attributes :id, :title, :plot, :created_at
end