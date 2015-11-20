class Update < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :service
  serialize :properties, Hash

  validate :validate_properties

  def validate_properties
    service.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end
end
