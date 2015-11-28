class MaleAnimal < Animal
  has_many :progeny, class_name: 'Animal', foreign_key: 'sire_id'

  def gender
    'Male'
  end

  def model_name
    Animal.model_name
  end
end
