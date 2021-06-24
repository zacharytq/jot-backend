class JotSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :id, :title, :location, :accepted, :formatted_date, :date_to_number
end
