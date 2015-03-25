module API
  class EventsController < API::ApplicationController
    skip_before_action :authenticate, only: [:index, :show]
    skip_authorization_check :only => [:index, :show]

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
