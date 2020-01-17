Rails.application.routes.draw do
  devise_for :users
  resources :events, :only => [:index, :new, :create, :show]
  # get 'events/show'
  get 'events/:id' => 'events#show'
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "events#index"
end
