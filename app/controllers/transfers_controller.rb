class TransfersController < ApplicationController
  before_action :authenticate_user!

  def create
    animal = Animal.find(params[:transfer][:animal_id])
    unless current_user == animal.owner
      render text: 'Unauthorized', status: :unauthorized and return
    end
    buyer = User.find_by(id: params[:transfer][:buyer_id])
    if buyer
      animal.transfer_to(buyer)
      redirect_to animal, notice: 'Successfully transfered animal'
    else
      redirect_to animal, alert: 'Failed to transfer animal'
    end
  end
end
