module API
  class EventsController < ApplicationController
    authorize_resource

    def index
      render json: Event.all
    end

    def show
      render json: Event.find(params[:id])
    end

    private

    def event_params
      params.require(:event).permit(:name, :location, :start_date, :end_date, :description, :hashtag, :interest_list).merge(owner: current_user.id)
    end
  end
end
