class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def create
    event = current_user.events.build(event_params)
    if event.save
      redirect_to event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:description, :date)
    end
end
