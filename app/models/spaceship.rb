class Spaceship < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true, inclusion: { in: ["A", "B", "C", "D", "E"] }
  validates :location, presence: true
  validates :price, presence: true
  validates :description, length: { minimum: 50 }
  validates :spead_of_light, presence: true
  validates :capacity, presence: true
  validates :fuel_drive, presence: true
  validates :brand, presence: true

end
