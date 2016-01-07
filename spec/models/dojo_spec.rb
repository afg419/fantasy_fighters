require 'rails_helper'

RSpec.describe Dojo, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:dojo_name)}
    it { is_expected.to validate_presence_of(:password)}
    it { is_expected.to validate_uniqueness_of(:dojo_name)}
  end
end
