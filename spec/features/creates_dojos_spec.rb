require 'rails_helper'

RSpec.feature "CreatesDojos", type: :feature do
  scenario "first time user creates their dojo" do
    visit root_path

    click_on "Register New Dojo"

    expect(current_path).to eq new_dojo_path

    fill_in "Dojo name", with: "Winter's Path Dojo"
    fill_in "Password", with: "serenity"
    click_on "Register"

    expect(current_path).to eq dojo_path
    expect(page).to have_content "Winter's Path Dojo"
    expect(page).to have_link "Invite New Combatant"
  end
end
