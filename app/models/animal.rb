class Animal < ActiveRecord::Base
  belongs_to :customer
  belongs_to :sire, class_name: 'Animal'
  belongs_to :dam, class_name: 'Animal'

  enum gender: { 'Male' => 'M', 'Female' => 'F' }
  enum embryo_transfer: {
    'None' => 'N',
    'Domestic' => 'D',
    'International' => 'I'
  }

  validate :sire_is_male
  validate :dam_is_female
  validates :birth_date,
            :gender,
            :birth_type,
            :embryo_transfer,
            :percentage,
            presence: true
  validates :percentage, inclusion: (1..100)
  validate :existence_of_sire
  validate :existence_of_dam

  def progeny
    if gender == 'Male'
      Animal.where(sire: self)
    else
      Animal.where(dam: self)
    end
  end

  def registration_id
    "#{gender_abbreviation}#{id.to_s.rjust(6, '0')}"
  end

  def add_sire(reg_id)
    return if reg_id.blank?
    id = id_from_reg_id(reg_id)
    sire = Animal.find_by(id: id)
    if sire
      self.sire = sire
    else
      @sire_not_exist = true
    end
  end

  def add_dam(reg_id)
    return if reg_id.blank?
    id = id_from_reg_id(reg_id)
    dam = Animal.find_by(id: id)
    if dam
      self.dam = dam
    else
      @dam_not_exist = true
    end
  end

  private

  def gender_abbreviation
    gender == 'Male' ? 'R' : 'F'
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

  def id_from_reg_id(reg_id)
    reg_id.gsub(/[^0-9]/, '')
  end
end
