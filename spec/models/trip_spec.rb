require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:trip) { create(:trip) }
  describe 'validations' do
    it { should validate_presence_of(:pickup_longitude) }
    it { should validate_presence_of(:pickup_latitude) }
    it { should validate_presence_of(:dropoff_longitude) }
    it { should validate_presence_of(:dropoff_latitude) }
    it { should validate_presence_of(:payment_type) }
    it { should validate_presence_of(:trip_status) }
  end

  describe 'associations' do
    it { should belong_to(:driver) }
    it { should belong_to(:rider) }
    it { should have_one(:cab) }
  end

  describe '.undeleted' do
    it 'returns current trip when no one is marked as deleted' do
      expect(Trip.undeleted).to eq([trip])
    end

    it 'never returns the deleted computer' do
      trip1 = create(:trip)
      trip2 = create(:trip)
      trip2.delete!
      expect(Trip.undeleted).to eq([trip1])
    end
  end

end
