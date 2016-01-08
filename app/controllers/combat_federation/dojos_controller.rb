class CombatFederation::DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def show
    @dojo = Dojo.find(params[:id])
  end
end
