class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_dojo, :current_federation?

  def current_federation?
    current_dojo && current_dojo.combat_federation?
  end

  def current_dojo
    Dojo.find(session[:dojo_id]) if session[:dojo_id]
  end
end
