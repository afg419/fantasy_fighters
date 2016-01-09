require 'rails_helper'

RSpec.feature "FederationCanSeeDojoCombatantPages", type: :feature do
  scenario "combat federation visits dojo combatant page" do
    dojo_1 = Dojo.create(dojo_name: "Flying Crane", password: "password")
    dojo_1.combatants.create(beth)

    dojo_2 = Dojo.create(dojo_name: "Aaron's Ninjas", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_dojo).returns(dojo_2)

    visit combat_federation_dojo_path(dojo_1)
    click_on "Beth"

    expect(page).to have_content "Beth"
    expect(page).to have_content "Race: Human"
    expect(page).to have_content "Strength: 0"
    expect(page).to have_content "Intelligence: 15"
    expect(page).to have_content "Dexterity: 0"
    expect(page).to have_content "Hp: 8"
    expect(page).to have_content "Matches: 0"
    expect(page).to have_content "Wins: 0"

    expect(page).to have_link "Combat Federation Dashboard"    
  end
end
