require 'rails_helper'

RSpec.feature "CombatFederations", type: :feature do
  scenario "combat federation can see link for combat federation dashboard" do
    combat_federation = Dojo.create(dojo_name: "Aaron's Ninjas", password: "password", role: 1)

    visit root_path
    click_on "Login"

    fill_in "Dojo name", with: "Aaron's Ninjas"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq dojo_path
    expect(page).to have_link "Combat Federation Dashboard"
  end

  scenario "fed sees links to each dojo's show page on combat federation dashboard" do
    dojo1 = Dojo.create(dojo_name: "Lenny's Ninjas", password: "password")
    dojo2 = Dojo.create(dojo_name: "Beth's Ninjas", password: "password")
    dojo3 = Dojo.create(dojo_name: "Toni's Ninjas", password: "password")

    combat_federation = Dojo.create(dojo_name: "Aaron's Ninjas", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_dojo).returns(combat_federation)

    visit dojo_path
    click_on "Combat Federation Dashboard"

    expect(page).to have_link "Lenny's Ninjas"
    expect(page).to have_link "Beth's Ninjas"
    expect(page).to have_link "Toni's Ninjas"

    click_on "Lenny's Ninjas"

    expect(page).to have_content "Welcome Combat Federation: Aaron's Ninjas to Lenny's Ninjas"
  end

  scenario "non fed dojo can't go to fed dashboard" do
    dojo_1 = Dojo.create(dojo_name: "Lenny's Ninjas", password: "password")
    dojo_2 = Dojo.create(dojo_name: "Beth's Ninjas", password: "password")
    dojo_3 = Dojo.create(dojo_name: "Toni's Ninjas", password: "password")

    ApplicationController.any_instance.stubs(:current_dojo).returns(dojo_1)

    visit dojo_path

    expect(page).not_to have_link "Combat Federation Dashboard"

    visit combat_federation_dojos_path
    expect(page).to have_content "404"

    visit combat_federation_dojo_path(dojo_2)
    expect(page).to have_content "404"
  end
end
