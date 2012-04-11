Tagger::Application.routes.draw do
  
  match 't', :to => 'tag#new'
  match '/', :to => 'tag#help'

end
