class SearchesController < ApplicationController
  def index
    render json: {
      message: "Welcome to the API 🚀 - Your main point of interaction will be sending a POST request to the /searches endpoint with a zip code in the params"
    },
    status: 200
  end

  def create
    @search = Search.new(search_params)
    if @search.process
      render json: {
        data: @search.results
      },
      status: 200
    else
      render json: {
        errors: @search.errors.full_messages
      },
      status: 400
    end
  end

  private

  def search_params
    params.permit(:zip)
  end
end
