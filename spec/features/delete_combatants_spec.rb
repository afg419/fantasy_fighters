require 'rails_helper'

RSpec.feature "DeleteCombatants", type: :feature do
  scenario "dojo can delete a combatant" do
    dojo = Dojo.create(dojo_name: "Winter's Path Dojo", password: "serenity")

    visit root_path
    click_on "Login"
    expect(current_path).to eq login_path

    fill_in "Dojo name", with: "Winter's Path Dojo"
    fill_in "Password", with: "serenity"
    click_on "Login"

    combatant = dojo.combatants.create(beth)
    
    visit dojo_combatant_path(combatant)
    click_on "Disqualify Combatant"

    expect(current_path).to eq dojo_path

    expect(page).not_to have_link("Beth")
  end
end
