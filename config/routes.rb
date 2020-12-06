Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #添加root
  root 'currencies#index'
  post 'search', to: 'currencies#search'

end
