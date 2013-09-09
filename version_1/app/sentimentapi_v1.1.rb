require 'rubygems'
require 'grape'
require 'json'
require '3scale/client'

class SentimentApiV1_1 < Grape::API
  version 'v1.1', :using => :path, :vendor => '3scale'
  error_format :json
  
  $client = ThreeScale::Client.new(:provider_key => "a170e5b43048ae325b527f25ce8443ea")
  
  helpers do
    def authenticate!
      response = $client.authorize(:app_id => params[:app_id], :app_key => params[:app_key])
      error!('403 Unauthorized', 403) unless response.success?
    end
  end
  
  resource :words do
    get ':word' do
        authenticate!
        {:word => params[:word], :sentiment => "unkown"}.to_json
    end
    
    post ':word' do
        authenticate!
      {:word => params[:word], :result => "thinking"}.to_json
    end 
  end
  
  resource :sentences do
    get ':sentence' do
        authenticate!
      {:sentence => params[:sentence], :result => "unkown"}.to_json
    end
  end

end
