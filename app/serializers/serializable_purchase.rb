class SerializablePurchase < JSONAPI::Serializable::Resource
	type "purchase"
	belongs_to :user
	belongs_to :video_content

	attributes :id, :price, :video_quality
end