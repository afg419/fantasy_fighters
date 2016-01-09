class CombatantsController < ApplicationController
  def new
    @dojo = current_dojo
    @combatant = Combatant.new
  end

  def create
    @combatant = Combatant.new(adjust_stats_for_race(combatant_params))
    @combatant[:dojo_id] = current_dojo.id
    if @combatant.save
      flash[:notice] = "#{@combatant.name.capitalize} has been initiated!"
      redirect_to dojo_combatant_path(@combatant)
    else
      flash[:error] = @combatant.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @combatant = current_dojo.combatants.find_by(name: params[:id].gsub("-", " "))
  end

  def edit
    @combatant = current_dojo.combatants.find_by(name: params[:id])
  end

  def update
    @combatant = current_dojo.combatants.find_by(name: params[:format])
    @combatant.update(name: params[:combatant][:name])
    redirect_to dojo_combatant_path(@combatant)
  end

  def destroy
    @combatant = current_dojo.combatants.find_by(name: params[:id].gsub("-", " "))
    @combatant.destroy
    redirect_to dojo_path
  end

private

  def adjust_stats_for_race(opts)
    case opts[:race]
    when "Ogre"
      opts[:intelligence] = opts[:intelligence].to_i - 1
      opts[:strength] = opts[:strength].to_i + 1
      opts[:hp] = 10
    when "Elf"
      opts[:intelligence] = opts[:intelligence].to_i + 1
      opts[:dexterity] = opts[:dexterity].to_i + 1
      opts[:strength] = opts[:strength].to_i - 2
      opts[:hp] = 6
    when "Human"
      opts[:hp] = 8
    end
    opts
  end

  def combatant_params
    params.require(:combatant).permit(:name, :strength, :intelligence, :dexterity).merge(race: params[:race])
  end
end
