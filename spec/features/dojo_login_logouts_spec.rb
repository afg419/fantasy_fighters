require 'rails_helper'

RSpec.feature "DojoLoginLogout", type: :feature do
  scenario "registered dojo can login" do
    Dojo.create(dojo_name: "Winter's Path Dojo", password: "serenity")

    visit root_path
    click_on "Login"
    expect(current_path).to eq login_path

    fill_in "Dojo name", with: "Winter's Path Dojo"
    fill_in "Password", with: "serenity"
    click_on "Login"

    expect(current_path).to eq dojo_path
    expect(page).to have_content "Winter's Path Dojo"
    expect(page).to have_link "Invite New Combatant"

    visit root_path
    expect(page).to have_content "Winter's Path Dojo"
  end

  scenario "logged in dojo can logout" do
    dojo = Dojo.create(dojo_name: "Winter's Path Dojo", password: "serenity")

    visit root_path
    click_on "Login"
    expect(current_path).to eq login_path

    fill_in "Dojo name", with: "Winter's Path Dojo"
    fill_in "Password", with: "serenity"
    click_on "Login"

    click_on "Logout"

    expect(current_path).to eq root_path
    expect(page).not_to have_content "Winter's Path Dojo"
  end


  # scenario "first time user creates their dojo" do
  #   visit root_path
  #
  #   click_on "Register New Dojo"
  #
  #   expect(current_path).to eq new_dojo_path
  #
  #   fill_in "Dojo name", with: "Winter's Path Dojo"
  #   fill_in "Password", with: "serenity"
  #   click_on "Register"
  #
  #   expect(current_path).to eq dojo_path
  #   expect(page).to have_content "Winter's Path Dojo"
  #   expect(page).to have_link "Invite New Combatant"
  # end
end
