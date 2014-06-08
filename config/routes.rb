Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :bookings
  end

  match '/products/seats_left',  to: 'products#seats_left',         via: 'get'

end
