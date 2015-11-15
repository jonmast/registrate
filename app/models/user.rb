require 'elasticsearch/model'

class User < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  geocoded_by :full_street_address
  after_validation :geocode

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :owned_animals, class_name: 'Animal', foreign_key: 'owner_id'
  has_many :bred_animals, class_name: 'Animal', foreign_key: 'owner_id'
  validates :name,
            :address1,
            :city,
            :state,
            :zip,
            :flock_name,
            :email,
            presence: true

  scope :locations, -> { where.not(latitude: nil, longitude: nil).select(:id, :flock_name, :name, :latitude, :longitude) }

  def full_street_address
    [address1, address2, city, state, zip, 'USA'].compact.join(', ')
  end

  def address
    [address1, address2, [city, state].join(', '), zip].compact.join('\n')
  end
end
