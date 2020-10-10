Rails.application.routes.draw do
  resources :transactions
  resources :bids
  resources :sellers
  resources :businesses
  resources :buyers
  post '/sellerlogin', to: 'sellerauth#create'
  post '/buyerlogin', to: 'buyerauth#create'
  get '/buyers/profile', to: 'buyers#profile'
  get '/sellers/profile', to: 'sellers#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
