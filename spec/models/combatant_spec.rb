require 'rails_helper'


RSpec.describe Combatant, type: :model do

  # context "validations" do
  #   it { is_expected.to validate_presence_of(:name) }
  #   it { is_expected.to validate_presence_of(:race) }
  #   it { is_expected.to validate_presence_of(:strength) }
  #   it { is_expected.to validate_presence_of(:intelligence) }
  #   it { is_expected.to validate_presence_of(:dexterity) }
  #   it { is_expected.to validate_presence_of(:hp) }
  #
  #   it { is_expected.to validate_inclusion_of(:strength).in_range(0..15) }
  #   it { is_expected.to validate_inclusion_of(:intelligence).in_range(0..15) }
  #   it { is_expected.to validate_inclusion_of(:dexterity).in_range(0..15) }
  #
  #   it { is_expected.to validate_uniqueness_of(:name).scoped_to(:dojo_id) }
  # end

  scenario "total attributes validation" do
    dojo = Dojo.create(dojo_name: "Aaron's Ninjas", password: "pass")
    puts dojo.errors.full_messages
    combatant_1 = dojo.combatants.create(name: "Beth", race: "Human", strength: 0, intelligence: 15, dexterity: 0, hp: 8)
    expect(combatant_1.valid?).to be true

    combatant_2 = dojo.combatants.create(name: "Aaron", race: "Elf", strength: 1, intelligence: 15, dexterity: 0, hp: 8)
    expect(combatant_2.invalid?).to be true
  end
end
