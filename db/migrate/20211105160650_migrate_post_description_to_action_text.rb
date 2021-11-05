class MigratePostDescriptionToActionText < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :description, :description_old
    Post.all.each do |p|
    p.update_attribute(:description, p.description_old)
    end
    remove_column :posts, :description_old
  end
end
