Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources for records not created by utl_index process
  resources :newspapers
  resources :townnews_sites
  resources :townnews_site_meta_data
  resources :utl_files
  # not :applications, that's fixed data
end
