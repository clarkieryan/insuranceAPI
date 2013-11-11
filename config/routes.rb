InsuranceAPI::Application.routes.draw do

  match '/*path' => 'application#cors_preflight_check', :via => :options
  #Set up the URl /api/v1 and default it to output JSON
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do

      #Adding in customers so /api/v1/customers will work
      resources :customers do
        resources :customer_details
       # match '/*path' => 'application#cors_preflight_check', :via => :options
      end


      #Quotes route mainly to retrieve a 'Compiled quote'
      resources :quotes

      #API key functions
      get 'APIKey/create' => 'api_key#create'
      get 'APIKey' => 'api_key#index'




    end
  end
end
