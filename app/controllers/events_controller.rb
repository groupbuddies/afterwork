class EventsController < ApplicationController
  load_and_authorize_resource
  
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

  def event_params
    params.require(:event).permit(:name, :location, :start_date, :end_date, :description, :hashtag)
  end

end
