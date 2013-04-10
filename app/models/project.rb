class Project < ActiveRecord::Base
  has_and_belongs_to_many :users # => , :class_name => 'User'

  # belongs_to :user

  has_many :projects_users
  has_many :tickets, :dependent => :destroy

  validates :user_id, presence: true
  validates :title, length: { maximum: 40 }, :presence => { :message => "You must give the project a title" }
  validates :description, length: { minimum: 10, maximum: 450 }, :presence => { :message => "You must give the project a description (minimum 10 characters)" }
  validates :start_date, :presence => { :message => "You must choose an start date" }
  validates :end_date, :presence => { :message => "You must choose an end date" }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id, :title, :description, :start_date, :end_date, :user_ids, :project_id
end