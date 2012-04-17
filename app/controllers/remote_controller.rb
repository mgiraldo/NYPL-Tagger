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
  
  def service
    if params[:s]=="add"
      url = params[:u]
      time = params[:t]
      if url != nil
        @bookmark = Bookmark.find_or_create_by_original_url(
          :original_url => url
        )
        @current_user.bookmarks << @bookmark
        @success = @current_user.save!
        if params[:callback] == nil
          render :json => {:callbak=>params[:callback], :response=>@success.to_json, :content=>@bookmark}, :layout => false
        else
          output = {:callbak=>params[:callback], :response=>@success.to_json, :content=>@bookmark}.to_json
          json = "#{params[:callback]}(#{output})"
          render :text => json, :layout => false
        end
      else
        render :json => {:response=>"error",:content=>"No url"}, :layout => false
      end
    else
      render :json => {:response=>"error",:content=>"Tagger by NYPL Labs"}
    end
  end

end
