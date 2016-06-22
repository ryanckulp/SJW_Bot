class NominationsController < ApplicationController
  skip_before_filter  :verify_authenticity_token # ignore CSRF exception block
  before_action :nomination_params, only: [:create]

  def new
  end

  def create
    Nomination.create(nomination_params)
    render json: {status: 'ok'}
  end

  private

    def nomination_params
      params.except('action', 'controller').as_json
    end

end
