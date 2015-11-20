class VehiclesController < ApplicationController

  before_action :set_vehicle, only: [:edit, :update, :destroy, :show]
  before_action :set_user
  before_action :authenticate_user!

  def garage
    @vehicles = @user.vehicles
  end

  def new
    @vehicle = Vehicle.new
  end

  def show
  end

  def create
    @vehicle = current_user.vehicles.build(vehicle_params)
    if @vehicle.save
      flash[:success] = "Vehicle Added!"
      redirect_to @vehicle
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: "Vehicle was succesfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to root_path
  end

private
  def set_user
    @user = current_user
  end

  def vehicle_params
    params.require(:vehicle).permit(:year, :make, :model, :nickname)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
  
end
