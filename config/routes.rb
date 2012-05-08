Tagger::Application.routes.draw do
 
  devise_for :patrons, :controllers => { :omniauth_callbacks => "patrons/omniauth_callbacks" }

  match 't', :to => 'tag#new'
  match '/', :to => 'tag#help'
  
  resources :patrons

  resources :bookmarks

  root :to => 'patrons#index'

  match 'remote/:action', :controller => 'remote'

  match 'save', :to => 'bookmarks#new'
  
  match 's/:s', :to => 'remote#service'
  match 's', :to => 'remote#service'

end
