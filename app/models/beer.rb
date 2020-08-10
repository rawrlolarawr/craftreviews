class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :reviews
end
