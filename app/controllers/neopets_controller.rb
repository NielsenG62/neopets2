class NeopetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @neopets = Neopet.all
    redirect_to root_path
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

  def feed
    @neopet = Neopet.find(params[:neopet_id])
    @neopet.feed
    if @neopet.waiting_to_feed
      flash[:notice] = "You put out the food, but #{@neopet.pet_name} doesn't seem to be hungry right now."
    end
    redirect_to neopet_path(params[:neopet_id])
  end

  def fight
    @neopet = Neopet.find(params[:neopet_id])
    @neopet.fight
    render :show
  end

  def destroy
    @neopet = Neopet.find(params[:id])
    @neopet.destroy
    flash[:notice] = "Your Neopet was 'released' to the farm :("
    redirect_to neopets_path
  end

  private
  def neopet_params
    params.require(:neopet).permit(:pet_name, :user_id)
  end
end