class Nominee < ActiveRecord::Base
  belongs_to :nominator

  after_save :promote_to_warrior?

  def promote_to_warrior?
    if self.votes == 5
      nominator = Nominator.find(self.nominator_id)
      warrior = Warrior.create(handle: self.handle, nominator_id: nominator.id)
      TwitterApi.update(".#{warrior.handle}, you're officially an SJW on http://www.sjwbot.com thanks to #{nominator.handle}")
    end
  end

end
