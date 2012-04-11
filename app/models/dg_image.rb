class DgImage < Bookmark
  
  has_and_belongs_to_many :patrons, :uniq => true, :join_table => "bookmarks_patrons", :foreign_key => "bookmark_id"

  def thumbnail_image_address
    "http://images.nypl.org/index.php?id=#{self.remote_ref}&t=t"
  end
  
  def link
    "http://digitalgallery.nypl.org/nypldigital/id?#{self.remote_ref}"
  end

end
