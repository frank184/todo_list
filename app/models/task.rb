class Task < ActiveRecord::Base
  validates :title, presence: true

  def title=(value)
    write_attribute(:title, value.titleize)
  end
end
