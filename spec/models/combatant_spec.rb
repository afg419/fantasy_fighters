require 'rails_helper'

RSpec.describe Combatant, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:race) }
    it { is_expected.to validate_presence_of(:strength) }
    it { is_expected.to validate_presence_of(:intelligence) }
    it { is_expected.to validate_presence_of(:dexterity) }
    it { is_expected.to validate_presence_of(:hp) }

    it { is_expected.to validate_inclusion_of(:strength).in_range(0..15) }
    it { is_expected.to validate_inclusion_of(:intelligence).in_range(0..15) }
    it { is_expected.to validate_inclusion_of(:dexterity).in_range(0..15) }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:dojo_id) }
  end
end
