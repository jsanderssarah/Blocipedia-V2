Rails.application.routes.draw do
  resources :wikis 

  get 'about' => 'welcome#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end

#we call the resources method and pass it a Symbol. This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post. We'll review the precise URIs created in a moment.
#
