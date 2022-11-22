class Spaceship < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: ["A", "B", "C", "D", "E"] }
  validates :location, presence: true
  validates :price, presence: true
  validates :description, length: { minimum: 15 }
  validates :speed_of_light, presence: true
  validates :capacity, presence: true
  validates :fuel_drive, presence: true
  validates :brand, presence: true

end
