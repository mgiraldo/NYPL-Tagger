class Bookmark < ActiveRecord::Base
  
  acts_as_taggable
  has_and_belongs_to_many :patrons, :uniq => true
  
  def before_save
    parse(self.original_url)
  end
  
  def link
    self.original_url
  end
  
  def display_link
    self.original_url.gsub(/^http:\/\/([^\/]*).*$/, '\1')
  end
  
private 

  # Takes a URL and decides which type of bookmark it is
  def parse(url)
    case url
    when /digitalgallery\.nypl\.org/ && /imageID/
      self.type = "DgImage"
      self.remote_ref = self.original_url.gsub(/^.*imageID=([^&]+).*$/, '\1')
      self.title.gsub!("NYPL Digital Gallery | ", "")
    when /ebooks\.nypl\.org/ && /ContentDetails/
      self.type = "Ebook"
      self.remote_ref = self.original_url.gsub(/^.*ContentDetails.htm?id=([^&]+).*$/, '\1')
      self.title.gsub!("The New York Public Library, eNYPL - ", "")
    when /catalog\.nypl\.org/
      self.type = "BibRecord"
    when /nypl\.org\/locations/
      self.type = "LibLocation"
      self.title.gsub!(" | The New York Public Library", "")
    when /nypl\.org\/events\/.*\/\d\d\d\d\/\d\d\/\d\d/
      self.type = "Event"
      date = url.gsub(/^.*nypl\.org\/events\/.*\/(\d\d\d\d)\/(\d\d)\/(\d\d).*/, '\2-\3-\1')
      self.title.gsub!(" | The New York Public Library", "")
      self.title = "#{date}: #{self.title}"
    else
      self.type = "Bookmark"
      self.title.gsub!(" | The New York Public Library", "")
    end
  end
  
end
