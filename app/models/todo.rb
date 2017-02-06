class Todo < ApplicationRecord
  belongs_to :user

  scope :completed, ->{where(:completed => true)}
  scope :uncompleted, -> {where( :completed => false )}

  def myprop
    self.completed
  end

end
