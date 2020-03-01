Rails.application.routes.draw do
  resources :converter

  root 'converter#index'
end


