FactoryGirl.define do
  factory :student do
    id 1
    username 'husseny'
    name 'Husseny'
    email 'husseny@web.de'
    password '12341234'
    password_confirmation '12341234'
  end

  factory :student_skill_state do
    student_id 1
    skill_id 1
    completed true
    collected false
  end

  factory :skill do
    id 1
    title 'foo'
    description 'bar'
    grade 2
  end
end