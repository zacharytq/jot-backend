require 'oj'

class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]
  before_action :url_for_images, only: [:index]

  # GET /images
  def index
    render json: ImageSerializer.new(@images).serializable_hash.to_json
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
    
    def url_for_images
      @images = Image.all.select do |i|
        i.image_url = url_for(i.image)
        i
      end
      @images
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:image)
    end
end
