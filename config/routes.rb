Rails.application.routes.draw do
  resources :tasks
  root 'tasks#index'
  patch 'tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete'

end
