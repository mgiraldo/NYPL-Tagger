class Patrons::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    @patron = Patron.find_for_open_id(request.env["omniauth.auth"], current_patron)

    if @patron.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @patron, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_patron_registration_url
    end
  end
end
