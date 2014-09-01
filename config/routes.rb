Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: 'sessions'}
  resource :scheduler, only: [:show, :create, :destroy]

  root 'schedulers#show'
end
