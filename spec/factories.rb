FactoryGirl.define do
  factory :student do
    id 1
    username 'husseny'
    name 'Husseny'
    email 'husseny@web.de'
    password '12341234'
    password_confirmation '12341234'
  end

  factory :developer do
    id 2
    username 'marco'
    name 'Marco'
    email 'marco@web.de'
    password '12341234'
    password_confirmation '12341234'
  end

  factory :student_skill_state do
    student_id 1
    skill_id 1
    completed true
    collected false
  end

  factory :course do
    title "course title"
    description "course description"
  end

  factory :domain do
    title "domain title"
    description "domain description"
    screening_title "domain screening title"
  end

  factory :skill do
    id 1
    title 'foo'
    description 'bar'
    grade 2
    domain
    course
  end
end