class CombatFederation::FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def new_combatants
    @dojo_1_combatants_names = Dojo.find_by(dojo_name: params[:dojo_1]).combatants.pluck(:name)
    @dojo_2_combatants_names = Dojo.find_by(dojo_name: params[:dojo_2]).combatants.pluck(:name)
    @fight = Fight.new
  end
end
