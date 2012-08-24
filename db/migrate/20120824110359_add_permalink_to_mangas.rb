class AddPermalinkToMangas < ActiveRecord::Migration
  def change
    add_column :mangas, :permalink, :string
  end
end
