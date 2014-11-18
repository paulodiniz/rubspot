require 'json'
require 'rubspot/representers/deal_representation'

module Rubspot
  class Deal < Rubspot::Base

    attr_accessor :vids, :companies, :portal_id, :dealname, :id

    def initialize(opts = {})
      opts.each do |opt|
        instance_variable_set("@#{opt[0]}", opt[1])
      end
    end

    # def self.find(id)
    #   uri = "https://api.hubapi.com/deals/v1/deal/#{id}?hapikey=#{Rubspot::API_KEY}&portalId=#{Rubspot::PORTAL_ID}"
    #   response = Rubspot::Base::get uri
    #   return nil unless response.ok?
    # end

    def save
      params = { 'associations' => {'associatedCompanyIds' => companies, 'associatedVids' => vids }, 'portalId' => portal_id, 'properties' => []}
      uri = "https://api.hubapi.com/deals/v1/deal?hapikey=#{Rubspot::API_KEY}&portalId=#{Rubspot::PORTAL_ID}"
      response = Rubspot::Base::post uri, params.to_json
      return false unless response.ok?
      populate_attributes_from response
      true
    end

    private
    def populate_attributes_from(response)
      Rubspot::DealRepresentation.new(self).from_json response.body
    end
  end
end