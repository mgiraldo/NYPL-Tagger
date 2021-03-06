class TagController < ApplicationController
  
  def new
    @tags = Bookmark.tag_counts.order("taggings.tags_count desc").limit(10)
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
  
  def help
    @bookmarklet_js = "javascript:
        function nyplt1() {
        var d = document,z = d.createElement('scr'+'ipt'),b = d.body,l = d.location;
        try {
            if (!b) throw (0);
            otitle = d.title;
            d.title = '(Saving...) ' + otitle;  
            d.title; 
            z.setAttribute('src', l.protocol + '//#{request.host_with_port}/t.js?u='+encodeURIComponent(l.href)+'&t='+(new Date().getTime()));
            b.appendChild(z);
        } catch (e) {
            alert('Please wait until the page has loaded.');
        }
    }
    nyplt1();
    void(0);".gsub(/\s{2}/,"").gsub(/\r/,"").gsub(/\n/,"")
  end
  
end
