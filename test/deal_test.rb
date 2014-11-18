require_relative './test_helper'

class DealTest < ActiveSupport::TestCase

  setup do
    Rubspot::API_KEY = "demo"
    Rubspot::PORTAL_ID = 62515
  end

  test 'initializing a deal' do
    deal = Rubspot::Deal.new(companies: [8954037], vids: [27136], portal_id: 62515, dealname: 'OldNewDeal')

    assert_equal 62515,        deal.portal_id
    assert_equal 'OldNewDeal', deal.dealname
    assert_equal [8954037],    deal.companies
    assert_equal [27136],      deal.vids
  end

  test 'creating a new deal' do
    deal = Rubspot::Deal.new(companies: [8954037], vids: [27136], portal_id: 62515, dealname: 'OldNewDeal')
    assert deal.save
    assert deal.id
  end

end