class RemoteController < ApplicationController

  def toolbar
    @parent_href = params[:parent]
    @parent_title = params[:title]
    @saved =  @current_user.bookmarks.exists?(:original_url => @parent_href)
    render :layout => false
  end

  def create
    # FIXME: No kinds of validation at all.
    @bookmark = Bookmark.find_or_create_by_original_url(
      :original_url => params[:p],
      :title => params[:t]
    )
    @current_user.bookmarks << @bookmark
    @success = @current_user.save!
    respond_to do |format|
        format.html { redirect_to :action => "toolbar" }
        format.js
      end
  end

end
