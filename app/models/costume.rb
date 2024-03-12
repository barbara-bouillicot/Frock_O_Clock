class Costume < ApplicationRecord
  belongs_to :user

  validates :name, :category, :size, :material, :price, :description, presence: true
  validates :description, length: { in: 6..200 }
end
