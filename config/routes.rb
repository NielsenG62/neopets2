Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :neopets do
    post'/feed' => 'neopets#feed'
    resources :battles
    get'screen1' => 'battles#screen1'
    get'screen2' => 'battles#screen2'
    get'screen3' => 'battles#screen3'
    get'screen4' => 'battles#screen3'
  end
end
