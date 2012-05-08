class ChangeBookmarksPatronsIds < ActiveRecord::Migration
  def up
	  rename_column :bookmarks_patrons, :bookmark_id, :bookmark_id_string
	  add_column :bookmarks_patrons, :bookmark_id, :integer
	  rename_column :bookmarks_patrons, :patron_id, :patron_id_string
	  add_column :bookmarks_patrons, :patron_id, :integer

	  BookmarksPatrons.reset_column_information
	  BookmarksPatrons.find_each { |c| c.update_attribute(:bookmark_id, c.bookmark_id_string) } 
	  BookmarksPatrons.find_each { |c| c.update_attribute(:patron_id, c.patron_id_string) } 
	  remove_column :bookmarks_patrons, :bookmark_id_string
	  remove_column :bookmarks_patrons, :patron_id_string
  end

  def down
  end
end
