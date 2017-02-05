class Task < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :title
  validates_presence_of :user

  scope :completed, -> { where(status: true) }
  scope :active, -> { where(status: false) }

  def completed?
    status
  end
end
