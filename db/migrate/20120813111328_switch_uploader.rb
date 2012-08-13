class SwitchUploader < ActiveRecord::Migration
  def up
  	remove_column :pages, :image_uid
  	remove_column :pages, :image_uid

  	add_column :pages, :image, :string
  end

  def down
  	remove_column :pages, :image

  	add_column :pages, :image_uid, :string
  	add_column :pages, :image_name, :string
  end
end
