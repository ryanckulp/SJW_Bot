class NominatorsController < ApplicationController

  def index
    @nominators = Nominator.all

  end



end
