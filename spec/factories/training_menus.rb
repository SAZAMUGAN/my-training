FactoryBot.define do
  factory :training_menu do
    name { Faker::Name.initials(number: 2) }
    muscle_category                { MuscleCategory.find_by_id 2 }
    explanation              { Faker::Lorem.sentence}
    association :user
    
  end
end
