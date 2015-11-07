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
    end
  end
  
  get '/companies', to: 'companies#index'
  get '/students', to: 'students#index'
  
  
end
