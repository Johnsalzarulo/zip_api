class SearchesController < ApplicationController
  def index
    render json: {
      message: "Welcome to the API 🚀 - Your main point of interaction will be sending a POST request to the /searches endpoint with a zip code in the params"
    },
    status: 200
  end

  def create
    data = ZipService.new(search_params[:zip]).perform
    render json: {
      data: data,
      message: "Zip code found"
    },
    status: 200
  end

  private

  def search_params
    params.permit(:zip)
  end
end
