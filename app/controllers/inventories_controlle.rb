class InventoriesController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @inventories = Inventory.all
    render :index
  end

  def new
    @inventory = Inventory.new
    render :new
  end

  def create @inventory = Inventory.new(inventory_params)
    if @inventory.save
      flash[:notice] = "Your new neopet is below"
      redirect_to inventory_path
    else
      flash[:alert] = "Your egg didn't hatch, try again"
      render :new
    end
  end

  def show
    @inventory = Inventory.find(params[:id])
     render :show
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:notice] = "That item went moldy so you trashed it."
    redirect_to inventory_path
  end

  private
  def inventory_params
    params.require(:inventory).permit(:inv_slot1, :inv_slot2, :inv_slot3, :inv_slot4)
  end
end