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
    # @neopet.update!(pet_hungry: @neopet.pet_hungry,
    #                 pet_pic: @neopet.pet_pic,
    #                 waiting_to_feed: @neopet.waiting_to_feed)
    # # binding.pry
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