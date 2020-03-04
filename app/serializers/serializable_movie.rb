class SerializableMovie < JSONAPI::Serializable::Resource
	type "movies"
	attributes :id, :title, :plot, :created_at
end