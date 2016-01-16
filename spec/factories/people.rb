FactoryGirl.define do
  factory :person do
    first_name 'Tom'
    last_name  'Fwz'
    dob        20.years.ago
  end
  
  factory :father, class: 'Father', parent: :person do
    gender :male
    type   :Father
  end

  factory :mother, class: 'Mother', parent: :person do
    gender :female
    type   :Mother
  end

  factory :son, class: 'Son', parent: :person do
    gender :male
    type   :Son
  end

  factory :daughter, class: 'Daughter', parent: :person do
    gender :female
    type   :Daughter
  end
end
