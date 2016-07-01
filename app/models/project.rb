class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attachment :thumbnail_image, type: :image

  def has_thumbnail_image?
    self.thumbnail_image_id?
  end
end
