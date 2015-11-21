class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]

  def index
    @updates = Update.all
  end

  def show
  end

  def new
    @update = Update.new(service_id: params[:service_id], vehicle_id: params[:vehicle_id])
    @vehicles = current_user.vehicles.all
  end

  def edit
  end

  def create
    @update = Update.new(update_params)

    respond_to do |format|
      if @update.save
        format.html { redirect_to @update, notice: 'Update was successfully created.' }
        format.json { render :show, status: :created, location: @update }
      else
        format.html { render :new }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { render :show, status: :ok, location: @update }
      else
        format.html { render :edit }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @update.destroy
    respond_to do |format|
      format.html { redirect_to updates_url, notice: 'Update was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_update
      @update = Update.find(params[:id])
    end

    def update_params
      params.require(:update).permit(:date, :mileage, :comment, :vehicle_id, :service_id).tap do |whitelisted|
        whitelisted[:properties] = params[:update][:properties] if params[:update][:properties]
      end
    end
end
