class Todo < ApplicationRecord
  has_many :todos

  scope :completed, ->{where(:completed => true)}
  scope :uncompleted, -> {where( :completed => false )}

  def myprop
    self.completed
  end

end
