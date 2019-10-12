Rails.application.routes.draw do
  get 'routes', to: "bus_routes#index"
  get 'routes/:id' => 'bus_routes#show', as: 'bus_route', id:/\d+/

  get 'streets', to: "streets#index"
  get 'streets/:id' => 'streets#show', as: 'street', id: /\d+/

  get 'stops', to: "bus_stops#index"
  get 'stops/:id' => 'bus_stops#show', as: 'stop', id: /\d+/

  post 'stops/find' => 'bus_stops#search', as: 'search_stops'
end