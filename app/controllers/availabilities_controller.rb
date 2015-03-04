class AvailabilitiesController < ApplicationController
  def index
    @availabilities = User.find(current_user.id).availabilities
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availabilities_params)

    if @availability.save
      redirect_to user_availabilities_path(current_user), notice: 'Added availability with success.'
    else
      render 'new'
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy

    redirect_to user_availabilities_path
  end

  private

  def availabilities_params
    params.require(:availability).permit(:week_day, :start_time, :end_time).merge(user_id: current_user.id)
  end
end
