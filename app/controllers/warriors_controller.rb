class WarriorsController < ApplicationController
  skip_before_filter  :verify_authenticity_token # ignore CSRF exception block
  before_action :add_allow_credentials_headers

  def check
    handle = params[:handle].downcase
    warrior = Warrior.find_by(handle: handle.downcase)

    if warrior.present?
      render json: {status: 'ok', sjw: 'true'}
    else
      render json: {status: 'ok', sjw: 'false'}
    end
  end

  private

    # TODO: make this strict to only Chrome extensions
    def add_allow_credentials_headers
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Credentials'] = 'true'
    end

    def options
      head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
    end

end
