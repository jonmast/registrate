User.destroy_all
Animal.destroy_all

users = FactoryGirl.build_list(:user, 10).map do |user|
  user.skip_confirmation!
  user.save!
  user
end
FactoryGirl.create_list(:ram, 5, owner: users[0], breeder: users[0], birth_date: 20.years.ago)
FactoryGirl.create_list(:ewe, 5, owner: users[0], breeder: users[0], birth_date: 20.years.ago)

200.times do
  sire = Animal.where(gender: 'M').order('RANDOM()').first
  dam = Animal.where(gender: 'F').order('RANDOM()').first
  birth_date = [sire.birth_date, dam.birth_date].max + 1.year + 5.months
  FactoryGirl.create(:animal,
                     sire: sire,
                     dam: dam,
                     breeder: dam.owner,
                     birth_date: birth_date,
                     owner: users.sample
                    )
end
