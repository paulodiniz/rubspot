require "rubspot/version"
require "rubspot/models/base"
require "rubspot/models/contact"
require "rubspot/models/deal"

module Rubspot
  API_KEY   = ENV["HUBSPOT_API_KEY"]
  PORTAL_ID = ENV["HUBSPOT_PORTAL_ID"]
end
