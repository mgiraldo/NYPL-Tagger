Tagger::Application.routes.draw do
 
  match 't', :to => 'tag#new'
  match '/', :to => 'tag#help'
  
  resources :patrons

  resources :bookmarks

  root :to => 'patrons#index'

  match 'remote/:action', :controller => 'remote'

  match 's/:s', :to => 'remote#service'
  match 's', :to => 'remote#service'

end
