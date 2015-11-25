require "rails_whitepages/version"
require 'net/http'
require 'uri'
require 'rubygems'
gem 'activesupport'
require 'active_support/all'

  
module RailsWhitepages
  class WhitePages
    
    def initialize(api_key)
       @api_version = "2.1"
       @api_key = api_key
       @base_uri = "https://proapi.whitepages.com/"
     end
 
     def find_person(query)
       make_http_call(query, "person")
     end
     
     def reverse_phone(phone)
       query["phone_number"] = phone
       make_http_call(query, "phone")
     end
   
     private
   
     def make_http_call(request, endpoint)
       request["api_key"] = @api_key
       url = URI.parse( @base_uri +  @api_version + "/" + endpoint + ".json?" + request.to_query )
       response = Net::HTTP.get( url  )
       return  JSON.parse(response)     
     end
  end
end
