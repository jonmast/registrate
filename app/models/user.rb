class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :owned_animals, class_name: 'Animal', foreign_key: 'owner_id'
  has_many :bred_animals, class_name: 'Animal', foreign_key: 'owner_id'
end
