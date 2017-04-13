Rails.application.routes.draw do

  resources :cocktails, only: [:index]

  get '/', to: 'cocktails#index'
end
