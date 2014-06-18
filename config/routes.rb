Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :bookings
  end

  match '/products/seats_left',  to: 'products#seats_left', via: 'get'
  match '/products/disabled_products',  to: 'products#disabled_products', via: 'get'
  match '/products/disabled_dates',  to: 'products#disabled_dates', via: 'get'

end
