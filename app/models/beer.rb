class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :reviews

    validates :name, presence: true
    validates :style, presence: true
    validates :abv, presence: true
end
