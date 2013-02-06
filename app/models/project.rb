class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :ticket

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :description, :start_date, :end_date
end
