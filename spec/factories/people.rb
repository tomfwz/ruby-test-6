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

  factory :son, parent: :person do
    gender :male
    type   :Son
  end
end
