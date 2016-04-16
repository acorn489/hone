FactoryGirl.define do
  factory :student do
    id 1
    username 'husseny'
    name 'Husseny'
    email 'husseny@web.de'
    password '12341234'
    password_confirmation '12341234'
  end

  factory :game_skill do
    id 1
    skill_id 1
    game_id 1
  end

  factory :game do
    title "mathsman"
    image ""
    android_link ""
    ios_link ""
    web_link ""
    redirect_uri "https://foo.bar"
    skills_list ["foo", "bar"]
  end

  factory :application, class: Doorkeeper::Application do
    id 1
    name "mathsman"
    uid "889182cb6e3639ada8cfbd2edce0284dd363001a1666f7da525e1e4ff02e74d0"
    secret "6a0999d3d2a504438b0fca65fb9a69bf4e14d196f4d7e7c90ad9433012af3b32"
    redirect_uri "urn:ietf:wg:oauth:2.0:oob"
    scopes ""
    owner_id 1
    owner_type "Game"
  end

  factory :developer do
    id 2
    username 'marco'
    name 'Marco'
    email 'marco@web.de'
    password '12341234'
    password_confirmation '12341234'
  end

  factory :completed_student_skills do
    student_id 1
    skill_id 1
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