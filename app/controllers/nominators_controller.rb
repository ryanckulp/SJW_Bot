class NominatorsController < ApplicationController

  def index
    # sorts by most to fewest nominations
    @nominators = Nominator.all.sort_by {|nom| -nom.nominees.count}
  end

end
