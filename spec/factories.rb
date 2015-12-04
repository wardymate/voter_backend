FactoryGirl.define do
  factory :idea do
    name "Lions Tour"
    description "Get smashed on the lions tour"
    user_id 2
  end

  factory :like do
    value 1
    user_id 2
    idea_id 3
  end

  factory :user do
    email "test@test.com"
  end


end

