# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Clans::Warriors', type: :request do
  let(:clan) {create(:clan)}
  let(:samurai) {create(:samurai, clan: clan)}
  let(:hussar) {create(:hussar, clan: clan)}
  let(:response_json) {JSON.parse(response.body)}

  describe 'GET /clans/:id/warriors' do
    it 'responds with 200' do
      get "/clans/#{clan.id}/warriors"
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /clans/:id/warriors' do
    let!(:hussar) {create(:hussar, clan: clan, death_date: '2018-06-20')}
    it 'returns only dead warriors' do
      get "/clans/#{clan.id}/warriors"
      expect(response_json.dig('data')[0].dig('attributes', 'death-date')).to eq('2018-06-20')
    end
  end

  describe 'GET /clans/:id/warrior/:id' do
    let(:warrior) {create(:samurai, name: name, clan: clan)}
    let(:name) {'Keneth Rath II'}
    it 'includes correct name of warrior' do
      get "/clans/#{clan.id}/warriors/#{warrior.id}"
      expect(response_json.dig('data', 'attributes', 'name')).to eq(name)
    end
  end

  context 'with valid name' do
    describe 'POST /clans/:id/warriors' do
      before {post "/clans/#{clan.id}/warriors", params: params}
      let(:params) {{name: 'Keneth Rath III'}}
      it 'respponds with 201' do
        expect(response.status).to eq(201)
      end
    end
  end

  context 'with invalid name' do
    let(:params) {{name: ''}}
    it 'responds with 422' do
      post "/clans/#{clan.id}/warriors", params: params
      expect(response.status).to eq(422)
    end
    it 'does not create clan' do
      expect {post "/clans/#{clan.id}/warriors"}.not_to change {Warrior.count}
    end
  end



end


