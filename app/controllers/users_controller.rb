class UsersController < ApplicationController
  before_filter :authenticate_user!, except: :show
  def show
    @user = User.find(params[:id])
    @animals = @user.owned_animals.order(birth_date: :desc).page(params[:page])
  end

  def dashboard
    @animals = current_user.owned_animals.page(params[:page])
  end
end
