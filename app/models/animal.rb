class Animal < ActiveRecord::Base
  belongs_to :customer
  belongs_to :sire, class_name: 'Animal'
  belongs_to :dam, class_name: 'Animal'
end
