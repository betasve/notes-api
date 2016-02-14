Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :notes, except: [:new, :edit] do
        resources :tags, only: [:index, :show]
      end

      resources :tags, only: [:index, :show] do
        resources :notes, only: [:index, :show]
      end
      get 'search', to: "search#index"
    end
  end
end

# Added this to enable url_for in serializers
Rails.application.routes.default_url_options[:host] = 'localhost'
