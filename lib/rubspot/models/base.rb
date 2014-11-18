require 'httpclient'
require 'uri'

module Rubspot
  class Base

    def self.get(uri)
      client = HTTPClient.new
      client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
      client.get(uri)
    end

    def self.post(uri, params = {})
      client = HTTPClient.new
      client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
      client.post(uri, params, {'Content-Type' => 'application/json'} )
    end

  end
end