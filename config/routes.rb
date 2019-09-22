Rails.application.routes.draw do
 devise_for :users, controllers: {
             registrations: 'users/registrations',
             omniauth_callbacks: "users/omniauth_callbacks"
             }

  devise_scope :user do
    get '/users' => 'users/registrations#show'
  end
  
 resources :foods do
   member do
     get :search
   end
 end
 root 'foods#search'

end
