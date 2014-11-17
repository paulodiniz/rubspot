require_relative './test_helper'
require 'json'

class ContactRepresentationTest < ActiveSupport::TestCase

  test 'representing a contact to hubspot api' do
    contact = Rubspot::Contact.new(email: 'teste@teste.com', firstname: 'Paulo')
    json = JSON.parse(Rubspot::ContactRepresentation.new(contact).to_json)
    assert_equal 'teste@teste.com', json["properties"][0]["value"]
    assert_equal 'Paulo', json["properties"][1]["value"]
  end
end