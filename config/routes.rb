Rails.application.routes.draw do
  resource :scheduler, only: :show
  resource :session,
    only: [:new, :create, :destroy],
    path_names: { new: 'login', destroy: 'logout' }

  root 'scheduler#index'
end
