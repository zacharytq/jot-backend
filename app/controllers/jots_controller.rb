class JotsController < ApplicationController
  def index
    @jots = Jot.all
    puts(JotSerializer.new(@jots).serializable_hash.to_json)
    options = {}
    options[:is_collection] = true
    render json: JotSerializer.new(@jots).serializable_hash.to_json
  end
end
