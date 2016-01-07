class SessionsController < ApplicationController
  def new
  end

  def create
    @dojo = Dojo.find_by(dojo_name: params[:session][:dojo_name])
    if @dojo && @dojo.authenticate(params[:session][:password])
      session[:dojo_id] = @dojo.id
      redirect_to dojo_path
    else
      flash.now[:error] = "Invalid username password combination"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
