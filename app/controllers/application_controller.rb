class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :set_current_user

  def set_current_user
    # HACK: hard-coded first user.
    @current_user = Patron.find(:first)
  end

end
