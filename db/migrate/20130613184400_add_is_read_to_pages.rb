class AddIsReadToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_read, :boolean, :default => false
    remove_column :chapters, :is_read
  end
end
