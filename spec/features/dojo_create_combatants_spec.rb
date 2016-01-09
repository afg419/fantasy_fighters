require 'rails_helper'

RSpec.feature "DojoCreateCombatants", type: :feature do
  scenario "dojo can create combatant" do
    dojo = Dojo.create(dojo_name: "Flying Crane", password: "password")
    ApplicationController.any_instance.stubs(:current_dojo).returns(dojo)

    visit dojo_path
    click_on "Invite New Combatant"

    expect(current_path).to eq new_dojo_combatant_path

    # save_and_open_page
    fill_in "Name", with: "Jordan"
    select "Ogre", :from => "race"
    #  8, :from => "strength"
    find("#combatant_strength").set(8)
    find("#combatant_intelligence").set(2)
    find("#combatant_dexterity").set(5)

    click_on "Initiate Combatant"

    expect(current_path).to eq dojo_combatant_path(Combatant.last)

    expect(page).to have_content "Jordan"
    expect(page).to have_content "Race: Ogre"
    expect(page).to have_content "Strength: 9"
    expect(page).to have_content "Intelligence: 1"
    expect(page).to have_content "Dexterity: 5"
    expect(page).to have_content "Hp: 10"
    expect(page).to have_content "Matches: 0"
    expect(page).to have_content "Wins: 0"
  end
end
