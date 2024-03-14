class User < ApplicationRecord
  has_many :costumes
  has_many :bookings
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :password, :location, presence: true
  validates :email, presence: true
  validates :photo, presence:true
end
