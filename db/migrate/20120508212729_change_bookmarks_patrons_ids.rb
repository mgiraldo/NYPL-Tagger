class ChangeBookmarksPatronsIds < ActiveRecord::Migration
  def up
	  rename_column :bookmarks_patrons, :bookmark_id, :bookmark_id_string
	  add_column :bookmarks_patrons, :bookmark_id, :integer
	  rename_column :bookmarks_patrons, :patron_id, :patron_id_string
	  add_column :bookmarks_patrons, :patron_id, :integer

	  remove_column :bookmarks_patrons, :bookmark_id_string
	  remove_column :bookmarks_patrons, :patron_id_string

	  ActiveRecord::Base.connection.execute("TRUNCATE TABLE bookmarks")
	  ActiveRecord::Base.connection.execute("TRUNCATE TABLE bookmarks_patrons")
	  ActiveRecord::Base.connection.execute("TRUNCATE TABLE taggings")
	  ActiveRecord::Base.connection.execute("TRUNCATE TABLE tags")
  end

  def down
  end
end
