class NomineesController < ApplicationController
  skip_before_filter  :verify_authenticity_token # ignore CSRF exception block
  before_action :add_allow_credentials_headers, only: [:create]
  before_action :nominee_params, only: [:create]

  def new
  end

  def create
     # downcase all twitter handles in case user changes their casing later (would fail lookup)
    nominee = Nominee.find_or_create_by(handle: nominee_params['nominee_handle'].downcase)

    # has the person been nominated before?
    if nominee.nominator_id.nil?
      nominator = Nominator.find_or_create_by(handle: nominee_params['nominator_handle'].downcase)
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

    # TODO: make this strict to only Chrome extensions
    def add_allow_credentials_headers
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Credentials'] = 'true'
    end

    def options
      head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
    end

end
