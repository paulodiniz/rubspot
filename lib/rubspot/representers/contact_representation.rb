require 'representable/json'

module Rubspot
  class ContactRepresentation < Representable::Decorator
    include Representable::JSON

    property :vid
    property :properties,
              setter: lambda { |val, args|
                                  self.email = val["email"]["value"] if val["email"]
                                  self.firstname = val["firstname"]["value"] if val["firstname"]
                              },
              getter: lambda { |_|
                                  properties_array = []
                                  [:email, :firstname].each { |field|
                                    properties_array << {'property' => field, 'value' => instance_variable_get("@#{field}")}
                                  }
                                  return properties_array
                              }
  end
end