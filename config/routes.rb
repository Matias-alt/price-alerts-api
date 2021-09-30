Rails.application.routes.draw do
  resources :minimum_prices
  namespace 'api' do
    namespace 'v1' do
      resources :price_alerts
      resources :cities
      resources :minimum_prices do
        collection do
          get :get_process
          get :get_by_alert_id
          get :get_redirect_url
        end
      end
    end
  end
end
