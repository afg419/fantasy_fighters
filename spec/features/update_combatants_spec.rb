require 'rails_helper'

RSpec.feature "UpdateCombatants", type: :feature do
  scenario "dojos can update combatants" do
    dojo = Dojo.create(dojo_name: "a", password:"p")
    combatant = dojo.combatants.create(beth)

    ApplicationController.any_instance.stubs(:current_dojo).returns(dojo)

    visit dojo_combatant_path(combatant)
    click_on "Change Name"

    fill_in "Name", with: "BethS"
    click_on "Update Combatant"

    updated_combatant = dojo.combatants.last
    expect(current_path).to eq dojo_combatant_path(updated_combatant)
    expect(page).to have_content("BethS")
  end
end
