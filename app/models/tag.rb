class Tag < ActiveRecord::Base
  def self.jscode
    "javascript:
          function nyplt1() {
          var d = document,z = d.createElement('scr'+'ipt'),b = d.body,l = d.location;
          try {
              if (!b) throw (0);
              otitle = d.title;
              d.title = '(Saving...) ' + otitle;  
              d.title;
              z.setAttribute('src', l.protocol + '//localhost:3000/t.js?u='+encodeURIComponent(l.href)+'&t='+(new Date().getTime()));
              b.appendChild(z);
          } catch (e) {
              alert('Please wait until the page has loaded.');
          }
      }
      nyplt1();
      void(0);".gsub(/\s{2}/,"").gsub(/\r/,"").gsub(/\n/,"")
  end
end
