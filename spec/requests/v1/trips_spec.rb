require 'rails_helper'

RSpec.describe 'Trips API', type: :request do
  let!(:vendor) { create(:vendor) }
  let!(:owner) { create(:owner, vendor_id: vendor.id) }
  let!(:driver1) { create(:driver, owner_id: owner.id) }
  let!(:driver2) { create(:driver, owner_id: owner.id) }
  let!(:driver3) { create(:driver, owner_id: owner.id) }
  let!(:cab_model) { create(:cab_model) }

  let!(:pink_cab1) { create(:cab, type: 'PinkCab', driver_id: driver1.id, cab_model_id: cab_model.id) }
  let!(:pink_cab2) { create(:cab, type: 'PinkCab', driver_id: driver2.id, cab_model_id: cab_model.id) }
  let!(:cab) { create(:cab, type: 'Cab', driver_id: driver3.id, cab_model_id: cab_model.id) }
  
  let(:rider) { create(:rider) }
  before {
    create(:cab_location, :sbi_panathur, cab: pink_cab1)
    create(:cab_location, :sbi_panathur_and_sobha, cab: pink_cab2)
    create(:cab_location, :mahadevpura, cab: cab)
  }

  describe 'POST v1/trips' do

    describe 'when the request is valid' do
      before {
        post v1_trips_path, params: valid_attributes.to_json, headers: valid_headers
      }

      context 'post request when pickup location is in reach' do
        let(:valid_attributes) { attributes_for(:trip, :valid_pickup, cab_type: 'PinkCab', rider_id: rider.id) }

        it 'creates a trip and assign cab to the rider' do
          expect(json.keys).to include("id", "cab", "driver", "rider")
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'post request when no cab in pickup location' do
        let(:valid_attributes) { attributes_for(:trip, :out_of_reach, cab_type: 'Cab',  rider_id: rider.id) }

        it 'returns no cab found message' do
          expect(json['message']).to eq("Sorry! No cabs available for your preference.")
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end

    describe 'when the request is invalid' do

      before { post v1_trips_path, params: invalid_attributes.to_json, headers: valid_headers }

      context "when trips's fields are invalid" do
        let(:invalid_attributes) { attributes_for(:trip, :valid_pickup, cab_type: 'PinkCab', payment_type: nil, rider_id: rider.id) }

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns a validation failure message' do
          expect(response.body)
              .to match(/Validation failed: Payment type can't be blank/)
        end
      end
    end

  end

end
