module Economic
  module FindByOtherReference
    def find_by_other_reference(other_reference)
      response = request(:find_by_other_reference,
        { other_reference: other_reference })

      handle_key = "#{Support::String.underscore(entity_class_name)}_handle".intern
      handles = [ response[handle_key] ].flatten.reject(&:blank?).collect do |handle|
        Entity::Handle.build(handle)
      end
    end
  end
end
