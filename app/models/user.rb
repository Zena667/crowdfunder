class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password
  has_many :projects
  validates :first_name, :last_name, :email, presence: true
  validates_presence_of :password, :on => :create
end
