class BattlesController < ApplicationController

  def index
    @neopet = Neopet.find(params[:neopet_id])
    render :show
  end

  def show
    @neopet = Neopet.find(params[:neopet_id])
    render :show
  end

  def fight
    @neopet = Neopet.find(params[:neopet_id])
    @fight_results = @neopet.fight
    @fight_results
    render :show
  end


  def destroy
    @neopet = Neopet.find(params[:id])
    @neopet.destroy
    flash[:notice] = "#{@neopet.pet_name} was killed in battle:("
    redirect_to neopets_path
  end

  private
  def neopet_params
    params.require(:neopet).permit(:pet_name, :user_id)
  end
end