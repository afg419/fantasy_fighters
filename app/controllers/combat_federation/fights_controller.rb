class CombatFederation::FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    dojo_1, combatant_1 = params[:combatant_1].split(": ")
    dojo_2, combatant_2 = params[:combatant_2].split(": ")

    dojo_1 =  Dojo.find_by(dojo_name: dojo_1)
    dojo_2 =  Dojo.find_by(dojo_name: dojo_2)

    combatant_1 = dojo_1.combatants.find_by(name: combatant_1)
    combatant_2 = dojo_2.combatants.find_by(name: combatant_2)

    winner = fight(combatant_1, combatant_2)
    loser = ([combatant_1, combatant_2] - [winner]).first

    f = Fight.new

    f.winning_dojo = winner.dojo
    f.losing_dojo = loser.dojo
    f.winning_combatant = winner
    f.losing_combatant = loser

    if f.save
      redirect_to combat_federation_dojos_path
    else
    end
  end

  def skills
    { strength: :intelligence, intelligence: :dexterity, dexterity: :strength }
  end

  def fight(combatant_1, combatant_2, skill_1 = skills.keys.sample, skill_2 = skills.keys.sample)

    attack_1 = combatant_1[skill_1] + modifier(skill_1, skill_2)
    attack_2 = combatant_2[skill_2] + modifier(skill_2, skill_1)

    if attack_1 < attack_2
      combatant_2
    elsif attack_2 < attack_1
      combatant_1
    else
      [combatant_1, combatant_2].sample
    end
  end

  def modifier(skill_1, skill_2)
    if skills[skill_1] == skill_2
      5
    else
      0
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
