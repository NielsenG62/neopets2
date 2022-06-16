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

  def screen1
    @neopet = Neopet.find(params[:neopet_id])
    render :screen1
  end

  def screen2
    @neopet = Neopet.find(params[:neopet_id])
    render :screen2
  end

  def screen3
    @neopet = Neopet.find(params[:neopet_id])
    render :screen3
  end

  def screen4
    @neopet = Neopet.find(params[:neopet_id])
    render :screen4
  end

  def screenS2
    @neopet = Neopet.find(params[:neopet_id])
    render :screenS2
  end


  private
  def neopet_params
    params.require(:neopet).permit(:pet_name, :user_id)
  end
end