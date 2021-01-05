Rails.application.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Admin::Engine, at: '/admin'
end
