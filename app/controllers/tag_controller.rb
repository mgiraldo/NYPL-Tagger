class TagController < ApplicationController
  
  def new
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
  
  def help
    @bookmarklet_js = Tag.jscode
  end
  
end
