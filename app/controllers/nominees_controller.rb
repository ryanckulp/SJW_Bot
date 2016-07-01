class NomineesController < ApplicationController
  skip_before_filter  :verify_authenticity_token # ignore CSRF exception block
  before_action :nominee_params, only: [:create]

  def new
  end

  def create
    nominee = Nominee.find_or_create_by(handle: nominee_params['nominee_handle'])

    # has the person been nominated before?
    if nominee.nominator_id.nil?
      nominator = Nominator.find_or_create_by(handle: nominee_params['nominator_handle'])
      nominee.nominator_id = nominator.id
      nominee.votes = 1
      nominee.save
    else
      current_votes = nominee.votes
      nominee.update(votes: current_votes + 1)
    end

    render json: {status: 'ok'}
  end

  private

    def nominee_params
      params.except('action', 'controller').as_json
    end

end
