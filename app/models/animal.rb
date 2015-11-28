require 'elasticsearch/model'

class Animal < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :sire, class_name: 'MaleAnimal'
  belongs_to :dam, class_name: 'FemaleAnimal'
  belongs_to :owner, class_name: 'User'
  belongs_to :breeder, class_name: 'User'
  belongs_to :breeder, class_name: 'User'
  has_many :transfers

  enum embryo_transfer: {
    'None' => 'N',
    'Domestic' => 'D',
    'International' => 'I'
  }
  enum registration_type: {
    'Fullblood' => 'F',
    'Purebred' => 'P',
    'Percentage' => 'X'
  }

  enum breed: ['Dorper', 'White Dorper']

  validate :sire_is_male
  validate :dam_is_female
  validates :birth_date,
            :birth_type,
            :breed,
            :embryo_transfer,
            :percentage,
            :registration_type,
            :type,
            presence: true
  validates :percentage, inclusion: (1..100)
  validates :birth_type, inclusion: (0..10)
  validates :artificial_insemination, inclusion: [true, false]
  validate :existence_of_sire
  validate :existence_of_dam

  def self.find_by_registration_id(reg_id)
    find_by(id: id_from_reg_id(reg_id))
  end

  def self.genders
    {
      'Male'   => 'M',
      'Female' => 'F'
    }
  end

  def progeny
    if gender == 'Male'
      Animal.where(sire: self)
    else
      Animal.where(dam: self)
    end
  end

  def registration_id
    gender_abbreviation +
      registration_type_abbreviation +
      id.to_s.rjust(6, '0')
  end

  def display_name
    "#{registration_type} #{breed} #{gender}"
  end

  def add_sire(reg_id)
    return if reg_id.blank?
    id = self.class.id_from_reg_id(reg_id)
    sire = MaleAnimal.find_by(id: id)
    if sire && sire.id != id
      self.sire = sire
    else
      @sire_not_exist = true
    end
  end

  def add_dam(reg_id)
    return if reg_id.blank?
    id = self.class.id_from_reg_id(reg_id)
    dam = FemaleAnimal.find_by(id: id)
    if dam && dam.id != id
      self.dam = dam
    else
      @dam_not_exist = true
    end
  end

  def transfer_to(buyer)
    Transfer.create(seller: owner, buyer: buyer, animal: self)
    update(owner: buyer)
  end

  def gender
  end

  def gender=(gender)
    return if gender.nil?

    if gender.start_with?('M')
      self.type = MaleAnimal
    elsif gender.start_with?('F')
      self.type = FemaleAnimal
    end
  end

  private

  def registration_type_abbreviation
    Animal.registration_types[registration_type]
  end

  def gender_abbreviation
    gender == 'Male' ? 'R' : 'E'
  end

  def sire_is_male
    errors.add(:sire, 'cannot be female') if sire && sire.gender == 'Female'
  end

  def dam_is_female
    errors.add(:dam, 'cannot be male') if dam && dam.gender == 'Male'
  end

  def existence_of_sire
    errors.add(:sire, 'does not exist') if @sire_not_exist
  end

  def existence_of_dam
    errors.add(:dam, 'does not exist') if @dam_not_exist
  end

  def self.id_from_reg_id(reg_id)
    reg_id.gsub(/[^0-9]/, '')
  end
end
