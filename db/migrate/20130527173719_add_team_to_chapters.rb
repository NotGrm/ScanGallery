class AddTeamToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :team, :string
  end
end
