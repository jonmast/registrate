class Animal < ActiveRecord::Base
  belongs_to :customer
  belongs_to :sire
  belongs_to :dam
end
