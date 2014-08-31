Rails.application.routes.draw do
  resource :scheduler, only: [:show, :create, :destroy]

  resource :session, only: [], path: '' do
    #https://github.com/plataformatec/devise/blob/master/lib/devise/rails/routes.rb#L359
    get :new, path: 'login', as: 'new'
    post :create, path: 'login'
    match :destroy, path: 'logout', via: [:post, :delete]
  end

  root 'schedulers#show'
end
