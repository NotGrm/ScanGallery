class AddDragonFlyColumns < ActiveRecord::Migration
  def up
  	add_column :pages, :image_uid, :string
  	add_column :pages, :image_name, :string
  end

  def down
  	remove_column :pages, :image_uid
  	remove_column :pages, :image_uid
  end
end
