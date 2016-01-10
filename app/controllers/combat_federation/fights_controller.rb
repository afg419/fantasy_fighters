class CombatFederation::FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    dojo_1, combatant_1 = params[:combatant_1].split(": ")
    dojo_2, combatant_2 = params[:combatant_2].split(": ")


    f = Fight.new

    f.winning_dojo = Dojo.find_by(dojo_name: dojo_1)
    f.losing_dojo = Dojo.find_by(dojo_name: dojo_2)
    f.winning_combatant = f.winning_dojo.combatants.find_by(name: combatant_1)
    f.losing_combatant = f.losing_dojo.combatants.find_by(name: combatant_2)

    if f.save
      redirect_to combat_federation_dojos_path
    else
    end
  end


  # {"utf8"=>"✓",
  #  "combatant_1"=>"Lenny's Ninjas: Carl",
  #  "combatant_2"=>"Beth's Ninjas: Taylor",
  #  "commit"=>"Fight!",
  #  "controller"=>"combat_federation/fights",
  #  "action"=>"create"}

  # def new_combatants
  #   @dojo_1_combatants_names = Dojo.find_by(dojo_name: params[:dojo_1]).combatants.pluck(:name)
  #   @dojo_2_combatants_names = Dojo.find_by(dojo_name: params[:dojo_2]).combatants.pluck(:name)
  #   @fight = Fight.new
  # end
end
