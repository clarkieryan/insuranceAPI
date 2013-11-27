InsuranceAPI::Application.routes.draw do

  resources :incidents

  match '/*path' => 'application#cors_preflight_check', :via => :options
  #Set up the URl /api/v1 and default it to output JSON
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do

      #Adding in customers so /api/v1/customers will work
      resources :customers do
        resources :customer_details
        resources :quotes do 
          resources :incidents
        end
       # match '/*path' => 'application#cors_preflight_check', :via => :options
      end




      #Quotes route mainly to retrieve a 'Compiled quote'
      get '/quote/:id' => 'quotes#getQuote'
      get '/quote/:quote_id/incidents' => 'incidents#getIncidents'

      #API key functions
      get 'APIKey/create' => 'api_key#create' 
      get 'APIKey' => 'api_key#index'




    end
  end

end
