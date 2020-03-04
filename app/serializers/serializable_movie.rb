class SerializableMovie < JSONAPI::Serializable::Resource
	type "movies"
	attributes :id, :title, :plot
end