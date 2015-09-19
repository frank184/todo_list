class Task < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true

  def title=(value)
    write_attribute(:title, value)
  end

end
