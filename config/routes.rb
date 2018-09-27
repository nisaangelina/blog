Rails.application.routes.draw do
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogposts#blogpost'
  # get  'static/home'
  get  '/about',   to: 'static#about'
  get  '/post',   to: 'static#sample_blog_page'
  get  '/contact',   to: 'static#contact'
  get  '/blogpost',   to: 'blogposts#blogpost'
  resources :users
  resources :blogposts

end
