require 'economic/proxies/entity_proxy'
require 'economic/proxies/actions/find_by_date_interval'
require 'economic/proxies/actions/find_by_handle_with_number'
require 'economic/proxies/actions/find_by_other_reference'

module Economic
  class InvoiceProxy < EntityProxy
    include FindByDateInterval
    include FindByHandleWithNumber
    include FindByOtherReference
  end
end
