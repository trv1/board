class User < ApplicationRecord
  # :omniauthable, :token_authenticatable, :encryptable, :validatable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :confirmable, :lockable, :registerable, :timeoutable

  has_many :adverts

  # attr_accessible :email, :password, :password_confirmation
  # :remember_me

  # validates :name, presence: true
  validates :email, presence: {message: 'Email не может быть пустым'}, format: {with: /\A\S+@\S+\z/, message: 'Неверный E-mail'}
  # validates :password, confirmation: true, allow_blank: true

  validate :validate_password

  def validate_password
    if password.to_s != password_confirmation.to_s && (password.present? || password_confirmation.present?)
      errors.add(:password_confirmation, :invalid, message: 'не совпадает с паролем')
    end
  end

  def send_confirmation_notification?
    false
  end
end
