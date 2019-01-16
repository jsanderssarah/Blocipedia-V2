Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  #The root method allows us to declare the default page the app loads when we navigate to the home page URL
  root 'welcome#index'
  # ^implied hash - also could be: root({to: 'welcome#index'})
end
