class SearchesController < ApplicationController
  def index
    render json: {
      data: ZipService.new(93001).perform,
      message: "Welcome to the API 🚀 - Your main point of interaction will be sending a POST request to the /searches endpoint."
    },
    status: 200
  end

  def new

  end

  private

  def search_params
    params.require(:search).permit(:zip)
  end
end
