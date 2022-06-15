Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :neopets do
    post'/feed' => 'neopets#feed'
  end
  resources :battles do
    post'/fight' => 'battles#fight'
  end
end
