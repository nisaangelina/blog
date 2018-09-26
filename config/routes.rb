Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'
  get  'static/home'
  get  '/about',   to: 'static#about'
  get  '/post',   to: 'static#sample_blog_page'
  get  '/contact',   to: 'static#contact'
end
