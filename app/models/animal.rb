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
  validates :registration_id, uniqueness: true
  validates :percentage, inclusion: (1..100)

  def progeny
    if gender == 'Male'
      Animal.where(sire: self)
    else
      Animal.where(dam: self)
    end
  end

  private

  def sire_is_male
    errors.add(:sire, 'cannot be female') if sire && sire.gender == 'Female'
  end

  def dam_is_female
    errors.add(:dam, 'cannot be male') if dam && dam.gender == 'Male'
  end
end
