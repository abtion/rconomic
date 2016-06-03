require 'economic/proxies/entity_proxy'
require 'economic/proxies/actions/find_by_date_interval'
require 'economic/proxies/actions/find_by_other_reference'

module Economic
  class CurrentInvoiceProxy < EntityProxy
    include FindByDateInterval
    include FindByOtherReference

    private

    # Initialize properties in invoice with values from owner
    def initialize_properties_with_values_from_owner(invoice)
      if owner.is_a?(Debtor)
        invoice.debtor = owner

        invoice.debtor_name         ||= owner.name
        invoice.debtor_address      ||= owner.address
        invoice.debtor_postal_code  ||= owner.postal_code
        invoice.debtor_city         ||= owner.city

        invoice.term_of_payment_handle  ||= owner.term_of_payment_handle
        invoice.layout_handle           ||= owner.layout_handle
        invoice.currency_handle         ||= owner.currency_handle
      end
    end
  end
end
