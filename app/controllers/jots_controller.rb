class JotsController < ApplicationController
  def index
    @jots = Jot.all
    puts(JotSerializer.new(@jots).serializable_hash.to_json)
    options = {}
    options[:is_collection] = true
    render json: JotSerializer.new(@jots, options).serializable_hash.to_json
  end

  def update
    @jot = Jot.find(params[:id])
    if @jot.update(jot_params)
      render json: JotSerializer.new(@jot).serializable_hash.to_json
    else
      render json: @jot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @jot = Jot.find(params[:id])
    @jot.destroy
  end

  private
  def jot_params
    params.require(:jot).permit(:id, :location, :title, :accepted)
  end
end
