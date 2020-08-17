class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :content, presence: true
end
