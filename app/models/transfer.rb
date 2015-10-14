class Transfer < ActiveRecord::Base
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :animal
end
