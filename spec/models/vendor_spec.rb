require 'rails_helper'

RSpec.describe Vendor, type: :model do

  describe "validations" do 
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
