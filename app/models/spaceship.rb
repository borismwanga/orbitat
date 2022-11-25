class Spaceship < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: ["A", "B", "C", "D", "E"] }
  validates :location, presence: true
  validates :price, presence: true
  validates :description, length: { minimum: 15 }
  validates :speed_of_light, presence: true
  validates :capacity, presence: true
  validates :fuel_drive, presence: true
  validates :brand, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
