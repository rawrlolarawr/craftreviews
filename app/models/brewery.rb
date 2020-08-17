class Brewery < ApplicationRecord
    has_many :beers

    validates :name, presence: true
    validates :location, presence: true
end
