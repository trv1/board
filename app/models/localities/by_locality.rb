class ByLocality < ApplicationRecord
  belongs_to :parent, class_name: 'ByLocality', optional: true
end
