require 'rails_helper'

RSpec.feature "CombatFederationCreatesFights", type: :feature do
  scenario "combat federation selects fightes from dojos to fight" do
    dojo_1 = Dojo.create(dojo_name: "Aaron's Ninjas", password: "password", role: 1)
    dojo_2 = Dojo.create(dojo_name: "Lenny's Ninjas", password: "password")
    dojo_3 = Dojo.create(dojo_name: "Beth's Ninjas", password: "password")

    c_1 = Combatant.create({name: "Beth", race: "Human", strength: 0, intelligence: 15, dexterity: 0, hp: 8})
    c_2 = Combatant.create({name: "Carl", race: "Ogre", strength: 0, intelligence: 15, dexterity: 0, hp: 10})
    c_3 = Combatant.create({name: "Hotdog", race: "Elf", strength: 6, intelligence: 6, dexterity: 3, hp: 6})
    c_4 = Combatant.create({name: "Taylor", race: "Human", strength: 5, intelligence: 9, dexterity: 1, hp: 8})

    dojo_1.combatants << c_1
    dojo_1.combatants << c_2

    dojo_2.combatants << c_2
    dojo_2.combatants << c_3

    dojo_3.combatants << c_4

    visit root_path
    click_on "Login"
    expect(current_path).to eq login_path

    fill_in "Dojo name", with: "Aaron's Ninjas"
    fill_in "Password", with: "password"
    click_on "Login"

    visit combat_federation_dojos_path

    click_on "Set up a match"

    select "Lenny's Ninjas: Carl", :from => "combatant_1"
    select "Beth's Ninjas: Taylor", :from => "combatant_2"

    click_on "Fight!"

    expect(current_path).to eq combat_federation_dojos_path
    expect(page).to have_content "Carl from Lenny's Ninjas"
    expect(page).to have_content "Taylor from Beth's Ninjas"

    click_on "Logout"

    visit root_path
    click_on "Login"

    fill_in "Dojo name", with: "Lenny's Ninjas"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content "matches: 1"
    expect(page).to have_content "Carl"
    expect(page).to have_content "Taylor of Beth's Ninjas"
  end
end
