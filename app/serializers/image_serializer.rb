class ImageSerializer
  include JSONAPI::Serializer
  attributes :id, :created_at, :jots
  link :image_url 
end
