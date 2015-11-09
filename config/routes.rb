Rails.application.routes.draw do

  get 'students/index'

  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions',
    passwords: 'students/passwords'
  }

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    sessions: 'companies/sessions',
    passwords: 'companies/passwords'
  }
  
  root to: 'static_pages#home'
  
  resources :projects do
    member do
      get :bid
      delete :unbid
      get :bids
    end
  end

  resources :companies, only: [:index]

  resources :students, only: [:index] do
    member do
      get :profile
    end
  end
  
  put "/project/:project_id/student/:id" => "projects#assigned", as: "assigned_project"
  
end
