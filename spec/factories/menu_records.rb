FactoryBot.define do
  factory :menu_record do
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    form_level { FormLevel.find_by_id 2 }
    weight { Faker::Number.decimal(l_digits: 1) }
    reps { Faker::Number.decimal(l_digits: 1) }
    circuit_menus { Faker::Lorem.sentence }
    memo { Faker::Lorem.sentence }
    association :user
    association :training_menu
  end
end
