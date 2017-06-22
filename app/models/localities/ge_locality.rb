class GeLocality < ApplicationRecord
  belongs_to :parent, class_name: 'GeLocality', optional: true
end
