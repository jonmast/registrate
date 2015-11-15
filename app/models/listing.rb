class Listing < ActiveRecord::Base
  belongs_to :animal

  def phone
    animal.owner.phone
  end

  def address
    animal.owner.address
  end
end
