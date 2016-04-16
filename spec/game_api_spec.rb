require 'rails_helper'
require 'shared_contexts'

describe 'Game API', :type => :request do
  describe 'GET /api/v1/complete_skill' do
    let!(:application) {FactoryGirl.create :application}
    let!(:student) {FactoryGirl.create :student}
    let!(:game) {FactoryGirl.create :game}
    let!(:token) {Doorkeeper::AccessToken.create! :application_id => application.id, :resource_owner_id => student.id}

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
        post "/api/v1/complete_skill", {skill_id: 2}
      }.to change { CompletedStudentSkills.count }
      expect(response.status).to eq 200
    end

    it 'doesnt add a new completion entry if one already exists' do
      # TODO
    end
  end
end