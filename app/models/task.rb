class Task < ActiveRecord::Base
  
  searchkick autocomplete: ['title']

  belongs_to :user

  validates :title, presence: true

  def title=(value)
    write_attribute(:title, value.titleize)
  end

end
