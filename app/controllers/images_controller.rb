require 'oj'

class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]

  # GET /images
  def index
    @images = Image.all

    render json: @images
  end

  # GET /images/1
  def show
    thing = ImageSerializer.new(@image).serializable_hash
    render json: thing
  end

  # POST /images
  def create
    @image = Image.new()
    @image.image.attach(params[:image])

    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
      @image.image_url = url_for(@image.image)
      @image
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:image)
    end
end
