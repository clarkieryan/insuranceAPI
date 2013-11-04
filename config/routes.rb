InsuranceAPI::Application.routes.draw do

  resources :customer_details

  resources :customers

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  #Set up the URl /api/v1 and default it to output JSON
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do

      #Adding in customers so /api/v1/customers will work
      resources :customers

      #Quotes route mainly to retrieve a 'Compiled quote'
      resources :quotes

      #API key functions
      get 'APIKey/create' => 'api_key#create'
      get 'APIKey' => 'api_key#index'
    end
  end
end
