class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
validates :space_driving_license, presence: true, uniqueness: true

has_many :spaceships
has_many :reservations
end
