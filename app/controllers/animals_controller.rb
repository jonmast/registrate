class AnimalsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @animal = Animal.find(params[:id])
    @transfer = Transfer.new
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = current_user.owned_animals.new(animal_params.merge(breeder: current_user))
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
                                   :breed,
                                   :percentage,
                                   :embryo_transfer,
                                   :artificial_insemination,
                                   :registration_type,
                                   :gender)
  end
end
