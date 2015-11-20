class Service < ActiveRecord::Base
  has_many :fields, class_name: "ServiceField"
  accepts_nested_attributes_for :fields, reject_if: :all_blank, allow_destroy: true
end
