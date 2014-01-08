InsuranceAPI::Application.routes.draw do

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


      # Allow search 
      match "quote/:email/:id" => "quotes#getQuote", :constraints => { :email => /.+%40.+\..*/ }, via: [:get]

      #API key functions
      get 'APIKey/create' => 'api_key#create' 
      get 'APIKey' => 'api_key#index'




    end
  end

end
