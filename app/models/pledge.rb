class Pledge < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  belongs_to :project
  validates :project, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0 }
  attr_accessible :amount, :user

end
