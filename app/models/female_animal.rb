class FemaleAnimal < Animal
  has_many :progeny, class_name: 'Animal', foreign_key: 'dam_id'

  def gender
    'Female'
  end

  def model_name
    Animal.model_name
  end
end
