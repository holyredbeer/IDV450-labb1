class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  belongs_to :project
  belongs_to :ticket

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password
end
