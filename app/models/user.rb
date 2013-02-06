class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  belongs_to :project
  belongs_to :ticket

  has_secure_password

  validates :first_name, presence: true, length: { maximum: 24 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password
end