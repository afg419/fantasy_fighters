require 'rails_helper'

RSpec.describe CombatFederation::FightsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "send proper params" do
        create_dojos_and_combatants
        lennys = Dojo.find_by(dojo_name: "Lenny's Ninjas")

        initial_fights_count = lennys.winning_fights.count + lennys.losing_fights.count
        expect(initial_fights_count).to eq 0

        post :create, { "combatant_1"=>"Lenny's Ninjas: Hotdog",
                       "combatant_2"=>"Beth's Ninjas: Taylor" }

        final_fights_count = lennys.winning_fights.count + lennys.losing_fights.count

        expect(final_fights_count).to eq 1

        fight = Fight.last

        expect([fight.winning_combatant.name, fight.losing_combatant.name].include?("Hotdog")).to be true
        expect([fight.winning_combatant.name, fight.losing_combatant.name].include?("Taylor")).to be true

        expect(response).to redirect_to(combat_federation_dojos_path)
      end
    end
  end
end
