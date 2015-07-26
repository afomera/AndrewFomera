class AddThumbnailToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :thumbnail_image_id, :string
  end
end
