class Nominee < ActiveRecord::Base
  belongs_to :nominator

  before_save :promote_to_warrior?

  def promote_to_warrior?
    if self.votes == ENV['MINIMUM_VOTES']
      nominator = Nominator.find(self.nominator_id)
      warrior = Warrior.create(handle: self.handle, nominator_id: nominator.id)
      self.warrior_status = true
      TwitterApi.update(".@#{warrior.handle}, you're now a registered SJW on http://www.sjwbot.com thanks to @#{nominator.handle}")
    end
  end

end
