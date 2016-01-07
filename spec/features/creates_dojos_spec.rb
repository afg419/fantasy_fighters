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

  context "invalid dojo attributes" do
    scenario "user doesn't provide name" do
      visit root_path
      click_on "Register New Dojo"

      fill_in "Password", with: "serenity"
      click_on "Register"

      expect(page).to have_content "Dojo name can't be blank"
    end

    scenario "user inputs name already taken" do
      Dojo.create(dojo_name: "Beth's Awesome Dojo", password: "1234")
      visit root_path
      click_on "Register New Dojo"


      fill_in "Dojo name", with: "Beth's Awesome Dojo"
      fill_in "Password", with: "some_password"
      click_on "Register"

      expect(page).to have_content "Dojo name has already been taken"
    end

    scenario "user doesn't provide a password" do
      visit root_path
      click_on "Register New Dojo"


      fill_in "Dojo name", with: "Beth's Awesome Dojo"
      click_on "Register"

      expect(page).to have_content "Password can't be blank"
    end
  end
end
