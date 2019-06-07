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
    before {create_list(:building, 2)}
    it 'includes correct number of records' do
      get '/buildings'
      response_json = JSON.parse(response.body)
      expect(response_json['data'].size).to eq(2)
    end
  end

  describe 'GET /building/:id' do
    let(:building) {
      create(:building, name: building_name, type: type,
             granary: granary)}

    let(:building_name) {'Stronghold no 1'}
    let(:type) {'Buildings::Stronghold'}
    let(:granary) {2}

    it 'includes correct name' do
      get "/buildings/#{building.id}"
      response_json = JSON.parse(response.body)
      expect(response_json.dig('data', 'attributes')).to eq('name' => 'Stronghold no 1', 'type' => 'Buildings::Stronghold', 'granary' => 2)
    end
  end


#
# describe 'POST /clans' do
#   before {post '/clans', params: params}
#   context 'with valid name' do
#     let(:params) {{name: 'Stary Oboz'}}
#     it 'responds with 201' do
#       expect(response.status).to eq(201)
#     end
#   end
# end

# describe 'GET/buildings' do
#
# end

#   {
#     "data": [
#         {
#             "id": "1",
#             "type": "buildings-strongholds",
#             "attributes": {
#                 "name": "Main stronghold",
#                 "type": "Buildings::Stronghold",
#                 "granary": 5000
#             },
#             "relationships": {
#                 "warriors": {
#                     "data": [
#                         {
#                             "id": "2",
#                             "type": "warriors-samurais"
#                         },
#                         {
#                             "id": "3",
#                             "type": "warriors-samurais"
#                         }
#                     ]
#                 }
#             }
#         },
#         {
#             "id": "2",
#             "type": "buildings-walls",
#             "attributes": {
#                 "name": "Northern wall",
#                 "type": "Buildings::Walls",
#                 "granary": 100
#             },
#             "relationships": {
#                 "warriors": {
#                     "data": [
#                         {
#                             "id": "4",
#                             "type": "warriors-hussars"
#                         }
#                     ]
#                 }
#             }
#         },
#         {
#             "id": "3",
#             "type": "buildings-walls",
#             "attributes": {
#                 "name": "Southern wall",
#                 "type": "Buildings::Walls",
#                 "granary": 100
#             },
#             "relationships": {
#                 "warriors": {
#                     "data": [
#                         {
#                             "id": "5",
#                             "type": "warriors-hussars"
#                         }
#                     ]
#                 }
#             }
#         }
#     ]
# }
end
