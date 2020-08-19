class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :search_by_name, ->(name) { where('name Like ?', name) }
end
