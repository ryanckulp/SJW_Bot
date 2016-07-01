class Nominee < ActiveRecord::Base
  belongs_to :nominator

  after_save :promote_to_warrior?

  def promote_to_warrior?
    if self.votes == 5
      nominator = Nominator.find(self.nominator_id)
      Warrior.create(handle: self.handle, nominator_id: nominator.id)
    end
  end

end
