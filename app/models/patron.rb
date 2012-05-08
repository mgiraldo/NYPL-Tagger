class Patron < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_and_belongs_to_many :bookmarks, :uniq => true, :order => "title"
  has_and_belongs_to_many :pages, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "Bookmark"}, :class_name => "Bookmark", :order => "title"
  has_and_belongs_to_many :dg_images, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "DgImage"}, :order => "title"
  has_and_belongs_to_many :lib_locations, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "LibLocation"}, :order => "title"
  has_and_belongs_to_many :bib_records, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "BibRecord"}, :order => "title"
  has_and_belongs_to_many :ebooks, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "Ebook"}, :order => "title"
  has_and_belongs_to_many :events, :uniq => true, :join_table => "bookmarks_patrons", :association_foreign_key => "bookmark_id", :conditions => {:type => "Event"}, :order => "title"

  devise :omniauthable #followed by anything else you need

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    puts access_token
    data = access_token.info
    if patron = Patron.where(:email => data["email"]).first
      patron
    else
      Patron.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}".strip
  end

end
