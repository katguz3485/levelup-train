# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clans API', type: :request do
  describe 'GET /clans' do
    it 'responds with 200' do
      get '/clans'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/clans' do
    before { create_list(:clan, 2) }
    it 'includes correct number of records ' do
      get '/clans'
      response_json = JSON.parse(response.body)
      expect(response_json['data'].size).to eq(2)
    end
  end

  describe 'GET /clans/:id' do
    let(:clan) { create(:clan, name: clan_name) }
    let(:clan_name) { 'Nowy Oboz' }
    it 'includes correct name' do
      get "/clans/#{clan.id}"
      response_json = JSON.parse(response.body)
      expect(response_json.dig('data', 'attributes', 'name')).to eq(clan_name)
    end
  end

  describe 'POST /clans' do
    before { post '/clans', params: params }
    context 'with valid name' do
      let(:params) { { name: 'Stary Oboz' } }
      it 'responds with 201' do
        expect(response.status).to eq(201)
      end
    end
  end

  context 'with invalid name' do
    let(:params) { { name: 'a' } }
    it 'responds with 422' do
      post '/clans', params: params
      expect(response.status).to eq(422)
    end
    it 'does not create clan' do
      expect { post '/clans' }.not_to change { Clan.count }
    end
  end
end
