class AddIsReadToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :is_read, :boolean, :default => 0
  end
end
