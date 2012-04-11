class Patron < ActiveRecord::Base

  has_and_belongs_to_many :bookmarks, :uniq => true, :order => "title"
  has_and_belongs_to_many :pages, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "Bookmark"}, :class_name => "Bookmark", :order => "title"
  has_and_belongs_to_many :dg_images, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "DgImage"}, :order => "title"
  has_and_belongs_to_many :lib_locations, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "LibLocation"}, :order => "title"
  has_and_belongs_to_many :bib_records, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "BibRecord"}, :order => "title"
  has_and_belongs_to_many :ebooks, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "Ebook"}, :order => "title"
  has_and_belongs_to_many :events, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "Event"}, :order => "title"

  def full_name
    "#{self.first_name} #{self.last_name}".strip
  end

end
