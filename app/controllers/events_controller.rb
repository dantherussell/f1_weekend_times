class EventsController < ApplicationController
  before_action :authenticate

  def new
    @weekend = Weekend.find(params[:weekend_id])
    @event = @weekend.events.new
  end

  def edit
    @weekend = Weekend.find(params[:weekend_id])
    @event = Event.find(params[:id])
  end

  def create
    @weekend = Weekend.find(params[:weekend_id])
    @event = @weekend.events.new(event_params)
    if @event.save
      redirect_to weekend_path(@weekend), notice: 'event was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @weekend = Weekend.find(params[:weekend_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to weekend_path(@weekend), notice: 'event was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @weekend = Weekend.find(params[:weekend_id])
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to weekend_path(@weekend), notice: 'event was successfully deleted.'
  end

  private
    def event_params
      params.require(:event).permit(:racing_class, :name, :start_time_date_field, :start_time_time_field)
    end
end
