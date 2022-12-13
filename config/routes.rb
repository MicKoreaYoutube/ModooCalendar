Rails.application.routes.draw do
  get "/FAQ", to: "faq#faq"
  devise_for :users
  resources :to_do_lists
  post "/to_do_lists/delete/:id", to: "to_do_lists#destroy"
  post "/to_do_lists/edit/:id", to: "to_do_lists#update"
  get "/", to: "index#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
