module AnimalsHelper
  def age_in_words(birth_date)
    months = (Time.now.year - birth_date.year) * 12 + (Time.now.month - birth_date.month)
    years, months = months.divmod(12)
    days = Time.now.day - birth_date.day
    months -= 1 if days < 0
    if months < 0
      years -= 1
      months += 12
    end
    if years == 0
      pluralize(months, 'month')
    else
      pluralize(years, 'year')
    end
  end

  def ancestry_tree(animal, max_depth = 3)
    content_tag :li, class: animal.gender do
      concat(link_to animal.registration_id, animal)
      if max_depth > 0 && (animal.sire || animal.dam)
        parent_tree = content_tag 'ul' do
          concat(ancestry_tree(animal.sire, max_depth - 1)) if animal.sire
          concat(ancestry_tree(animal.dam, max_depth - 1)) if animal.dam
        end
        concat(parent_tree)
      end
    end
  end

  def multi_birth_name(number)
    %w(
      embryo
      single
      twin
      triplet
      quadruplet
      quintuplet
      sextuplet
      septuplet
      octuplet
      nonuplet
      decaplet
    )[number]
  end
end
