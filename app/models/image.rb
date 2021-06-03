class Image < ApplicationRecord
  has_one_attached :image
  has_many :jots
end
