class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :number
      t.belongs_to :chapter

      t.timestamps
    end
    add_index :pages, :chapter_id
  end
end
