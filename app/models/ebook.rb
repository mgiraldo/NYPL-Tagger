class Ebook < Bookmark

  has_and_belongs_to_many :patrons, :uniq => true, :join_table => "bookmarks_patrons", :foreign_key => "bookmark_id"

end
