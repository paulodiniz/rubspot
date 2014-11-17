require 'rubspot/representers/contact_representation'

module Rubspot
  class Contact < Rubspot::Base

    attr_accessor :vid, :email, :firstname

    def initialize(opts = {})
      opts.each do |opt|
        instance_variable_set("@#{opt[0]}", opt[1])
      end
    end

    def self.find_by_email(email)
      response = Rubspot::Base::get("https://api.hubapi.com/contacts/v1/contact/email/#{email}/profile?hapikey=#{Rubspot::API_KEY}")
      return nil unless response.ok?
      Rubspot::ContactRepresentation.new(Rubspot::Contact.new).from_json response.body
    end

    def save
      params = Rubspot::ContactRepresentation.new(self).to_hash
      response = Rubspot::Base::post("http://api.hubapi.com/contacts/v1/contact/createOrUpdate/email/#{self.email}/?hapikey=#{Rubspot::API_KEY}&portalId=#{Rubspot::PORTAL_ID}", params)
      response.ok?
    end
  end
end