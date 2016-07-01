class Nominee < ActiveRecord::Base
  belongs_to :nominator

  after_save :check_if_warrior

  def check_if_warrior
    if self.votes >= 5
      nominator = Nominator.find(self.nominator_id)
      Warrior.create(handle: self.handle, nominator_id: nominator.id)
    end
  end

end
