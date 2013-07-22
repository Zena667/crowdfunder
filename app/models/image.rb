class Image < ActiveRecord::Base
  attr_accessible :file, :project_id

  belongs_to :project
  validates :file, presence: true
  validates_format_of :file, :with => %r{\.(png|jpg|jpeg)$}i, :message => "Files must be png, jpg, jpeg format."
  mount_uploader :file, ImageUploader
end