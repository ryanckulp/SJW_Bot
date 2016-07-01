class Nominator < ActiveRecord::Base
  has_many :nominees
  has_many :warriors

end
