require 'rails_helper'
require 'shared_contexts'

describe 'Game API', :type => :request do
  describe 'GET /api/v1/complete_skill' do
    let!(:student) {FactoryGirl.create :student}
    let!(:game) {FactoryGirl.create :game}
    let!(:application) {FactoryGirl.create :application, owner: game}
    let!(:skill) {FactoryGirl.create :skill}
    let!(:game_skill) {FactoryGirl.create :game_skill, game_id: game.id, skill_id: skill.id}
    let!(:token) {Doorkeeper::AccessToken.create! application_id: application.id, resource_owner_id: student.id}

    before do
      allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token) {token}
      allow_any_instance_of(ApplicationController).to receive(:current_resource_owner) {game}
    end

    it 'fails with status 400 when skill_id missing' do
      post "/api/v1/complete_skill"

      expect(response.status).to eq 400
    end

    it 'adds a new completion entry' do
      expect {
        post "/api/v1/complete_skill", {skill_id: 1}
      }.to change { CompletedStudentSkill.count }
      expect(response.status).to eq 200
    end

    it 'adds a new completion entry even if it exists for another user' do
      FactoryGirl.create :completed_student_skill, skill_id: 1, student_id: student.id + 1
      expect {
        post "/api/v1/complete_skill", {skill_id: 1}
      }.to change { CompletedStudentSkill.count }
      expect(response.status).to eq 200

    end

    it 'doesnt add a new completion entry if one already exists' do
      FactoryGirl.create :completed_student_skill, skill_id: 1, student_id: student.id
      expect {
        post "/api/v1/complete_skill", {skill_id: 1}
      }.not_to change { CompletedStudentSkill.count }
      expect(response.status).to eq 200
    end

    it 'fails to add a completion entry for a skill not belonging to the current game' do
      expect {
        post "/api/v1/complete_skill", {skill_id: 2}
      }.not_to change { CompletedStudentSkill.count }
      expect(response.status).to eq 400
    end
  end
end