class NeopetsController < ApplicationController

  def index
    @neopets = Neopet.all
    render :index
  end

  def new
    @neopet = Neopet.new
    render :new
  end

  def create 
    @neopet = Neopet.new(neopet_params)
    if @neopet.save
      flash[:notice] = "Your new neopet is below"
      redirect_to neopets_path
    else
      flash[:alert] = "Your egg didn't hatch, try again"
      render :new
    end
  end

  def show
    @neopet = Neopet.find(params[:id])
     render :show
  end

  def destroy
    @neopet = Neopet.find(params[:id])
    @neopet.destroy
    flash[:notice] = "Neopet was released to the farm :("
    redirect_to neopets_path
  end

  private
  def neopet_params
    params.require(:neopet).permit(:name)
  end
end