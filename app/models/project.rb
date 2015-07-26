class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attachment :thumbnail_image, type: :image
end
