class ImageSerializer
  include JSONAPI::Serializer
  attributes :id, :created_at, :jots, :image_url 
end
