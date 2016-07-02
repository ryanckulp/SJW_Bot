class Warrior < ActiveRecord::Base
  belongs_to :nominator

  # callbacks
  after_create :set_nominee_status

  def set_nominee_status
    nominee = Nominee.where(handle: self.handle)
    nominee.warrior_status = true
    nominee.save
  end

end
