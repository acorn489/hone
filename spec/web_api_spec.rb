require 'rails_helper'
require 'shared_contexts'

describe 'Web API', :type => :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  describe 'GET /api/v1/skills' do
    let!(:developer) { FactoryGirl.create :developer}
    let!(:student) { FactoryGirl.create :student }
    let!(:skill) { FactoryGirl.create :skill }

    it 'fails with status 401 when not authorized' do
      get "/api/v1/skills", {course_id: skill.course_id}

      expect(response.status).to eq 401
    end

    it 'fails with status 400 when course_id missing' do
      sign_in(student)

      get "/api/v1/skills"

      expect(response.status).to eq 400
    end

    it 'returns status 200 when authorized' do
      sign_in(student)

      get "/api/v1/skills", {course_id: skill.course_id}

      expect(response.status).to eq 200
    end

    it 'returns empty array if no skills available' do
      sign_in(student)

      get "/api/v1/skills", {course_id: 164}

      skills = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(skills.length).to eq 0
    end

    describe 'as developer' do
      it 'returns array with skills' do
        FactoryGirl.create :student_skill_state
        sign_in(developer)

        get "/api/v1/skills", {course_id: skill.course_id}

        expect(response.status).to eq 200
        skills = JSON.parse(response.body)
        expect(skills.length).to eq 1
      end

      it 'response has skill properties without completion attributes' do
        FactoryGirl.create :student_skill_state
        sign_in(developer)

        get "/api/v1/skills", {course_id: skill.course_id}

        expect(response.status).to eq 200
        skills = JSON.parse(response.body)
        expect(skills[0]["id"]).to eq 1
        expect(skills[0]["grade"]).to eq 2
        expect(skills[0]["title"]).to eq "foo"
        expect(skills[0]["domain_id"]).to eq skill.domain_id
        expect(skills[0]["completed"]).to eq nil
        expect(skills[0]["collected"]).to eq nil
      end
    end

    describe 'as student' do
      it 'returns array with skills and states' do
        FactoryGirl.create :student_skill_state
        sign_in(student)

        get "/api/v1/skills", {course_id: skill.course_id}

        expect(response.status).to eq 200
        skills = JSON.parse(response.body)
        expect(skills.length).to eq 1
      end

      it 'returns skills without states' do
        sign_in(student)

        get "/api/v1/skills", {course_id: skill.course_id}

        expect(response.status).to eq 200
        skills = JSON.parse(response.body)
        expect(skills[0]["completed"]).to eq false
        expect(skills[0]["collected"]).to eq false
      end

      it 'returns stateful skills' do
        FactoryGirl.create :student_skill_state
        sign_in(student)

        get "/api/v1/skills", {course_id: skill.course_id}

        expect(response.status).to eq 200
        skills = JSON.parse(response.body)
        expect(skills[0]["completed"]).to eq true
        expect(skills[0]["collected"]).to eq false
      end

      it 'response has skill properties' do
        FactoryGirl.create :student_skill_state
        sign_in(student)

        get "/api/v1/skills", {course_id: skill.course_id}

        expect(response.status).to eq 200
        skills = JSON.parse(response.body)
        expect(skills[0]["id"]).to eq 1
        expect(skills[0]["grade"]).to eq 2
        expect(skills[0]["title"]).to eq "foo"
        expect(skills[0]["domain_id"]).to eq skill.domain_id
        expect(skills[0]["completed"]).to eq true
        expect(skills[0]["collected"]).to eq false
      end
    end
  end
end