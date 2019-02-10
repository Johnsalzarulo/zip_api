class SearchesController < ApplicationController
  def index
    render json: {
      data: ZipService.new(@zip).perform,
      message: "Welcome to the API 🚀 - Your main point of interaction will be sending a POST request to the /searches endpoint."
    },
    status: 200
  end

  def create
    render json: {
      data:  ZipService.new(search_params[:zip]).perform,
      message: "Welcome to the API 🚀 - Your main point of interaction will be sending a POST request to the /searches endpoint."
    },
    status: 200
  end

  private

  def search_params
    params.permit(:zip)
  end
end
