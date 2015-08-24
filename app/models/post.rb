class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title
  validates_presence_of :content

  scope :published, -> { where(published: true) }

end
