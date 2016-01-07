class DojosController < ApplicationController

  def new
    @dojo = Dojo.new
  end

  def create
    @dojo = Dojo.new(dojo_params)
    if @dojo.save
      session[:dojo_id] = @dojo.id
      redirect_to dojo_path
    else
      flash[:error] = @dojo.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    current_dojo
  end

private

  def dojo_params
    params.require(:dojo).permit(:dojo_name, :password)
  end


end
