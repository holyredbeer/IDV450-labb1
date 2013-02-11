class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password
  has_secure_password

  has_and_belongs_to_many :projects
  has_many :tickets

  before_save :create_remember_token

  validates :first_name, presence: true, length: { maximum: 24 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end