class User < ApplicationRecord
  # :omniauthable, :token_authenticatable, :encryptable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :registerable, :timeoutable

  has_many :adverts

  # attr_accessible :email, :password, :password_confirmation
  # :remember_me

  validates :name, presence: true
  validates :email, presence: true
end
