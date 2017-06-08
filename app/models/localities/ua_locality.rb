class UaLocality < ApplicationRecord
  belongs_to :parent, class_name: 'UaLocality', optional: true
end
