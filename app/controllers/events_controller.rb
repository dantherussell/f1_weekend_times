class EventsController < ApplicationController
  before_action :get_season
  before_action :get_weekend
  before_action :authenticate

  def new
    @event = @weekend.events.new
  end

  def edit
    @event = @weekend.events.find(params[:id])
  end

  def create
    @event = @weekend.events.new(event_params)
    if @event.save
      redirect_to weekend_path(@weekend), notice: 'event was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to weekend_path(@weekend), notice: 'event was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to weekend_path(@weekend), notice: 'event was successfully deleted.'
  end

  private
    def get_season
      @season = Season.find(params[:season_id])
    end

    def get_weekend
      @weekend = @season.weekends.find(params[:weekend_id])
    end

    def event_params
      params.require(:event).permit(:racing_class, :name, :start_time_date_field, :start_time_time_field)
    end
end
