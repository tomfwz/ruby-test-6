FactoryGirl.define do
  factory :person do
    first_name 'Tom'
    last_name  'Fwz'
    dob        20.years.ago
  end
  
  factory :father, parent: :person do
    gender :male
    type   :Father
  end

  factory :mother, parent: :person do
    gender :female
    type   :Mother
  end

  factory :son, class: 'Son', parent: :person do
    gender :male
    type   :Son
  end
end
