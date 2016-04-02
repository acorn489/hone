require 'rails_helper'
require 'shared_contexts'

describe 'Skills API', :type => :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  describe 'GET /api/v1/skills' do
    let!(:student) { FactoryGirl.create :student }

    it 'fails with status 401 when not authorized' do
      get "/api/v1/skills"

      expect(response.status).to eq 401
    end

    it 'returns status 200 when authorized' do
      sign_in(student)

      get "/api/v1/skills"

      expect(response.status).to eq 200
    end

    it 'returns empty array if no skills available' do
      sign_in(student)

      get "/api/v1/skills"

      skills = JSON.parse(response.body)
      expect(skills.length).to eq 0
    end

    it 'returns array with skills and states' do
      FactoryGirl.create :student_skill_state
      FactoryGirl.create :skill
      sign_in(student)

      get "/api/v1/skills"

      skills = JSON.parse(response.body)
      expect(skills.length).to eq 1
    end

    it 'returns skills without states' do
      FactoryGirl.create :skill
      sign_in(student)

      get "/api/v1/skills"

      skills = JSON.parse(response.body)
      expect(skills[0]["completed"]).to eq false
      expect(skills[0]["collected"]).to eq false
    end

    it 'returns stateful skills' do
      FactoryGirl.create :skill
      FactoryGirl.create :student_skill_state
      sign_in(student)

      get "/api/v1/skills"

      skills = JSON.parse(response.body)
      expect(skills[0]["completed"]).to eq true
      expect(skills[0]["collected"]).to eq false
    end
  end
end