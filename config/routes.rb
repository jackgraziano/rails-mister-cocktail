Rails.application.routes.draw do

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  get '/', to: 'cocktails#index'
end
