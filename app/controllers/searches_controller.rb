class SearchesController < ApplicationController
  def show
    if (animal = Animal.find_by_registration_id(params[:search][:term]))
      redirect_to animal and return
    end
  end
end
