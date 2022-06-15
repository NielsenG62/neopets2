Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :neopets do
    post'/feed' => 'neopets#feed'
    resources :battles
    post'/fight' => 'battles#fight'
  end
  # resources :battles
end
