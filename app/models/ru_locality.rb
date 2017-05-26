class RuLocality < ApplicationRecord
  belongs_to :parent, class_name: 'RuLocality', optional: true
end
