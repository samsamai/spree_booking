Spree::Core::Engine.routes.draw do
  # Add your extension routes here
    # get '/admin/bookings', to: 'admin/bookings#index'

  namespace :admin do
    resource :bookings
  end

end
