class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method :current_dojo
  before_action :current_dojo


  def current_dojo
    @dojo ||= Dojo.find(session[:dojo_id]) if session[:dojo_id]
  end
end
