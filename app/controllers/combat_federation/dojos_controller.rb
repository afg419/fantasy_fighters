class CombatFederation::DojosController < ApplicationController
  before_action :require_combat_federation

  def index
      @dojos = Dojo.all
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def require_combat_federation
    render file: "/public/404" unless current_federation?
  end
end
