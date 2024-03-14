class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, :category, :size, :material, :price, :description, presence: true
  validates :description, length: { in: 6..200 }
  validates :photos, presence:true


  include PgSearch::Model
    pg_search_scope :search_by_name_and_description_category_material,
    against: [ :name, :description, :category, :material, :size],
    using: {
    tsearch: { prefix: true }
  }
end
