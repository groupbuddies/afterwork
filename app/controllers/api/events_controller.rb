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

    def attend
      @event = Event.find(params[:id])

      if Attendee.attending?(current_user.id, @event.id)
        Attendee.create(user_id: current_user.id, event_id: @event.id)
      end

      render json: @event
    end

    def cancel_attend
      @event = Event.find(params[:id])

      unless Attendee.attending?(current_user.id, @event.id)
        Attendee.find_by(user_id: current_user.id, event_id: @event.id).delete
      end

      render json: @event
    end

    private

    def event_params
      params.require(:event).permit(:name, :location, :start_date, :end_date, :description, :hashtag, :interest_list).merge(owner: current_user.id)
    end
  end
end
