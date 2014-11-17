require_relative './test_helper'

class ContactTest < ActiveSupport::TestCase

  test 'initialize' do
    contact = Rubspot::Contact.new(email: 'teste@teste.com', firstname: 'Paulo')
    assert_equal 'teste@teste.com', contact.email
    assert_equal 'Paulo',           contact.firstname
  end

  test 'finding by email' do
    contact = Rubspot::Contact.find_by_email('paulo.rc.diniz@gmail.com')
    assert_equal 'paulo.rc.diniz@gmail.com', contact.email
    assert_equal 188806, contact.vid
  end

  test 'not finding' do
    contact = Rubspot::Contact.find_by_email('omg@becky.com')
    refute contact
  end

  test 'saving a contact on hubspot' do
    contact = Rubspot::Contact.new(email: 'paulo.rc.diniz@gmail.com', firstname: 'Modificado')
    assert_equal 'paulo.rc.diniz@gmail.com', contact.email
    assert_equal 'Modificado', contact.firstname
    contact.save

    fetched_contact = Rubspot::Contact.find_by_email('paulo.rc.diniz@gmail.com')
    assert_equal 'Modificado', fetched_contact.firstname
  end
end