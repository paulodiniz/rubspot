require 'representable/json'

module Rubspot
  class DealRepresentation < Representable::Decorator
    include Representable::JSON

    property :portal_id, as: :portalId
    property :id, as: :dealId

    nested :associations do
      collection :companies, as: :associatedCompanyIds
      collection :vids, as: :associatedVids
    end

  end
end