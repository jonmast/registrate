class AnimalsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.add_sire(params[:animal][:sire])
    @animal.add_dam(params[:animal][:dam])
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:birth_date,
                                   :birth_type,
                                   :percentage,
                                   :embryo_transfer,
                                   :artificial_insemination,
                                   :registration_type,
                                   :gender)
  end
end
