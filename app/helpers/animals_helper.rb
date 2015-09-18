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
end
