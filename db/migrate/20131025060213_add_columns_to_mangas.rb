class AddColumnsToMangas < ActiveRecord::Migration
  def change
    add_column :mangas, :author, :string
    add_column :mangas, :status, :string
    add_column :mangas, :presentation, :text
  end
end
