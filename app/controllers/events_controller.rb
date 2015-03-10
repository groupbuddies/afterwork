class EventsController < ApplicationController
  authorize_resource

  def index
    @events_per_month = Event.future.group_by { |event| event.start_date.month }

    respond_to do |format|
      format.html
      format.json { render json: Event.future }
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
    authorize! :manage, @event
  end

  def create
    @event = Event.new(event_params)
    @event.owner_id = current_user.id

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

    @event.attend(current_user.id)  unless @event.attending?(current_user.id)

    redirect_to event_path(@event)
  end

  def cancel
    @event = Event.find(params[:id])

    if @event.attending?(current_user.id)
      @event.cancel(current_user.id)
    end
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :start_date, :end_date, :description, :hashtag, :interest_list)
  end
end
