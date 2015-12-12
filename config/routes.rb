Rails.application.routes.draw do
  
  devise_for :users
  root to: 'home#index'

  post :incoming, to: 'incoming#create'

end
