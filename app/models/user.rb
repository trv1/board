class User < ApplicationRecord
  # :omniauthable, :token_authenticatable, :encryptable, :validatable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :confirmable, :lockable, :registerable, :timeoutable

  has_many :adverts

  # attr_accessible :email, :password, :password_confirmation
  # :remember_me

  # validates :name, presence: true
  validates :email, presence: {message: 'Email не может быть пустым'}, format: {with: /\A\S+@\S+\z/, message: 'Неверный E-mail'}

  before_commit :validate_password

  def validate_password
    if password != password_confirmation
      errors.messages = errors.messages.merge({password: 'GOPA'})
    end
  end
end
