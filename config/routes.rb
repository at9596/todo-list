Rails.application.routes.draw do
  resource :example, constraints: -> { Rails.env.development? }
  root "tasks#index"
  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task'
  # Generate
  resources :tasks
end
