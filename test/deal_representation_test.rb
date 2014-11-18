require_relative './test_helper'
require 'json'

class DealRepresentationTest < ActiveSupport::TestCase
  test '' do
    deal = Rubspot::Deal.new(companies: [8954037], vids: [27136], portal_id: 62515, dealname: 'OldNewDeal', id: 30)
    hash = Rubspot::DealRepresentation.new(deal).to_hash

    assert_equal 62515, hash['portalId']
    assert_equal 30,    hash['dealId']

    assert_equal [8954037], hash['associations']['associatedCompanyIds']
    assert_equal [27136],   hash['associations']['associatedVids']
  end
end