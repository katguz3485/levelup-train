# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Buildings', type: :request do
  describe 'GET /buildings' do
    it 'responds with 200' do
      get '/buildings'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/buildings' do
    before { create_list(:building, 2) }
    it 'includes correct number of records' do
      get '/buildings'
      response_json = JSON.parse(response.body)
      expect(response_json['data'].size).to eq(2)
    end
  end

  describe 'GET /building/:id' do
    let(:building) do
      create(:building, name: building_name, type: type,
                        granary: granary)
    end

    let(:building_name) { 'Stronghold no 1' }
    let(:type) { 'Buildings::Stronghold' }
    let(:granary) { 2 }

    it 'includes correct name' do
      get "/buildings/#{building.id}"
      response_json = JSON.parse(response.body)
      expect(response_json.dig('data', 'attributes')).to eq('name' => 'Stronghold no 1',
                                                            'siege-ability' => 0,
                                                            'type' => 'Buildings::Stronghold',
                                                            'granary' => 2)
    end
  end
end
