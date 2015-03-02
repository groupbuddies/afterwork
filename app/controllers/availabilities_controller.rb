class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availabilities_params)

    if @availability.save
      redirect_to root_path, notice: 'Added availability with success.'
    else
      render 'new'
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy

    redirect_to 'index'
  end

  def availabilities_params
    params.require(:availability).permit(:week_day, :start_time, :end_time)
  end
end
