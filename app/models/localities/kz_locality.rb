class KzLocality < ApplicationRecord
  belongs_to :parent, class_name: 'KzLocality', optional: true
end
