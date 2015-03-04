class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new 
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event), notice: 'Event Created Sucessfully'
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path, notice: 'Event Updated Sucessfully'
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path
  end

  def attend
    @event = Event.find(params[:id])

    if Attendee.attending?(current_user.id, @event.id)
      Attendee.create(user_id: current_user.id, event_id: @event.id)
      flash[:notice] = "You are attending to #{@event.name}"
      render 'show'
    else
      render 'show'
    end
  end

  def cancel_attend
    @event = Event.find(params[:id])

    if !Attendee.attending?(current_user.id, @event.id)
      Attendee.find_by(user_id: current_user.id, event_id: @event.id).delete
      flash[:notice] = "You are not going to #{@event.name}"
      render 'show'
    else
      render 'show'
    end
  end

  def event_params
    params.require(:event).permit(:name, :location, :start_date, :end_date, :description, :hashtag)
  end
end
