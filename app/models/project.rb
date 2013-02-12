class Project < ActiveRecord::Base
  has_and_belongs_to_many :users # => , :class_name => 'User'

  belongs_to :user
  has_many :tickets, :dependent => :destroy

  validates :user_id, presence: true
  validates :title, length: { maximum: 40 }, :presence => { :message => "Du maste ange en titel" }
  validates :description, length: { minimum: 10, maximum: 450 }, :presence => { :message => "Du maste ange en beskrivning med minst 10 tecken" }
  validates :start_date, :presence => { :message => "Du maste valja ett startdatum" }
  validates :end_date, :presence => { :message => "Du maste valja ett slutdatum" }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id, :title, :description, :start_date, :end_date, :user_ids
end