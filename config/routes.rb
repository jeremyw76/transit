Rails.application.routes.draw do
  get 'routes', to: "bus_routes#index"
  get 'routes/:id' => 'bus_routes#show', as: 'bus_route', id:/\d+/

  post 'routes/find' => 'bus_routes#search', as: 'search_routes'

  get 'streets', to: "streets#index"
  get 'streets/:id' => 'streets#show', as: 'street', id: /\d+/

  post 'streets/find' => 'streets#search', as: 'search_streets'

  get 'stops', to: "bus_stops#index"
  get 'stops/:id' => 'bus_stops#show', as: 'stop', id: /\d+/

  post 'stops/find' => 'bus_stops#search', as: 'search_stops'

  get 'about', to: 'about#show'
  get 'about/erd', to: 'about#erd', as: 'about_erd'
end