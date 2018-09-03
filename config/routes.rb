Rails.application.routes.draw do
  devise_for :users
  # namespace :admin do
  #   resources :clients
  #   resources :projects
  #   resources :regions
  #   root to: "clients#index"
  # end
  # MudRouter.load

  post 'anons/:objname', :to => 'anons#create', :as => 'anons'
  get 'anons/:objname', :to => 'anons#new', :as => 'new_anon'

  namespace :admin do
    root :to => 'clients#index'
    MudRouter.load.each do |rr|
      obj_model = rr.model_name
      resources obj_model.route_key.to_sym do
        collection do
          get :import
          post :do_import
        end
      end
    end
  end

  resources :charts, :only => [] do
    collection do
      get 'telephony_week'
    end
  end

  get 'import/:model_name' => 'csv#import', :as => 'import'
  post 'do_import/:model_name' => 'csv#do_import', :as => 'do_import'

  get 'index' => 'dashboard#index', :as => 'index'
  get 'landing' => 'dashboard#landing', :as => 'landing'
  root :to => 'dashboard#landing'
end
