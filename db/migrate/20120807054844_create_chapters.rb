class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :number
      t.belongs_to :manga

      t.timestamps
    end
    add_index :chapters, :manga_id
  end
end
