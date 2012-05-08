class ChangeBookmarksPatronsColumnLimit < ActiveRecord::Migration
  def up
    change_column :bookmarks_patrons, :bookmark_id, :integer, :limit => 10, :null => false, :default => 0
    change_column :bookmarks_patrons, :patron_id, :integer, :limit => 10, :null => false, :default => 0
  end

  def down
  end
end
