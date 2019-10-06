Rails.application.routes.draw do
  get 'streets', to: "streets#index"
  get 'streets/:id' => 'streets#show', as: 'street', id: /\d+/

  get 'stops', to: "bus_stops#index"
  get 'stops/:id' => 'bus_stops#show', as: 'stop', id: /\d+/
end
