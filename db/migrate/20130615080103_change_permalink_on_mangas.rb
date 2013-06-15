class ChangePermalinkOnMangas < ActiveRecord::Migration
  def change
    remove_column :mangas, :permalink

    add_column :mangas, :slug, :string

    add_index :mangas, :slug, unique: true

    Manga.find_each(&:save)
  end
end
