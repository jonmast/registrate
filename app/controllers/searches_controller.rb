class SearchesController < ApplicationController
  def show
    if (animal = Animal.find_by_registration_id(search_params[:term]))
      redirect_to animal and return
    end
    @search = Search.new(search_params)
  end

  private

  def search_params
    params.require(:search).permit(:term).merge(page: params[:page])
  end
end
