class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :locations]
  def show
    @user = User.find(params[:id])
    @animals = @user.owned_animals.order(birth_date: :desc).page(params[:page])
  end

  def dashboard
    @animals = current_user
               .owned_animals
               .order(birth_date: :desc)
               .page(params[:page])
  end

  def locations
    render json: User.locations
  end
end
