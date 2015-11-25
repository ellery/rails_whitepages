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
       make_http_call(query, "person.json")
     end
     
     def reverse_phone(phone)
       query["phone_number"] = phone
       make_http_call(query, "phone.json")
     end
     
     def email_validation(email)
       query = Hash.new
       query["email_address"] = email
       make_http_call(query, "identity_score/email_address_", "2.0")
     end

     def reverse_address(query)
       make_http_call(query, "location.json")
     end
     
     def find_business(name,city)
       query = Hash.new
       query["name"] = name
       query["city"] = city
       make_http_call(query, "business.json")
     end
     
     private
   
     def make_http_call(request, endpoint, api_version = @api_version)
       request["api_key"] = @api_key
       url = URI.parse( @base_uri +  api_version + "/" + endpoint + "?" + request.to_query )
       response = Net::HTTP.get( url  )
       return  JSON.parse(response)     
     end
  end
end
