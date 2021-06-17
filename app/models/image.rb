class Image < ApplicationRecord
  has_one_attached :image
  has_many :jots
  attr_reader :image_url

  def image_url=(value)
    @image_url = value
  end
end
