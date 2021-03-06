Rails.application.routes.draw do

  get 'students/index'

  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions',
    passwords: 'students/passwords',
    omniauth_callbacks: 'students/omniauth_callbacks'
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
      put :done
    end
  end

  put "/project/:project_id/student/:id" => "projects#assigned", as: "assigned_project"
  get "/project/:project_id/student/:id/nextstep" => "projects#nextstep", as: "nextstep_project"

  resources :companies, only: [:index]

  resources :messages, only: [:index]
  get "/message/:student_id/company/:id" => "messages#new", as: "message"
  post "/message/:student_id/company/:id" => "messages#create"
  put "/message/:student_id/company/:id" => "messages#update" 
  delete "/message/:student_id/company/:id" => "messages#destroy" 
  
  resources :students, only: [:index] do
    member do
      get :profile
      get :yourprojects
    end
  end

  
end
