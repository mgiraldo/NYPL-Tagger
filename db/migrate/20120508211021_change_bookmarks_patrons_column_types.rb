class ChangeBookmarksPatronsColumnTypes < ActiveRecord::Migration
  def up
    change_column :bookmarks_patrons, :bookmark_id, :integer
    change_column :bookmarks_patrons, :patron_id, :integer
  end

  def down
  end
end
