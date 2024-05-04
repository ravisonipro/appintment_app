Rails.application.routes.draw do

  root 'home#index'
  
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get '/signup/doctor', to: 'registrations#new_doctor', as: 'signup_doctor'
    post '/signup/doctor', to: 'registrations#create_doctor'

    get '/signup/receptionist', to: 'registrations#new_receptionist', as: 'signup_receptionist'
    post '/signup/receptionist', to: 'registrations#create_receptionist'
  end

  get 'doctors/dashboard', to: 'doctors#dashboard'

  resources :appointments
  resources :patients
end
