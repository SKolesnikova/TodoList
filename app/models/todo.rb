class Todo < ApplicationRecord
  belongs_to :list

  scope :completed, ->{where(:completed => true)}
  scope :uncompleted, -> {where( :completed => false )}

  validates :title, presence: true

  def myprop
    self.completed
  end

end
