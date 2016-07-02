class Nominator < ActiveRecord::Base
  has_many :nominees
  has_many :warriors


  def on_twitter
    "@#{self.handle}"
  end

  def nominations
    Nominee.where(nominator_id: self.id).count
  end

  def warriors_confirmed
    Warrior.where(nominator_id: self.id).count
  end

end
