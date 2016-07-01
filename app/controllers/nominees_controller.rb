class NomineesController < ApplicationController
  skip_before_filter  :verify_authenticity_token # ignore CSRF exception block
  before_action :nominee_params, only: [:create]

  def new
  end

  def create
    Nominee.create(nominee_params)
    render json: {status: 'ok'}
  end

  private

    def nominee_params
      params.except('action', 'controller').as_json
    end

end
