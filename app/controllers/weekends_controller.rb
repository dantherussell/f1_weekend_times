class WeekendsController < ApplicationController
  before_action :get_season
  before_action :authenticate, only: %i(destroy edit new create update)

  def show
    @weekend = @season.weekends.find(params[:id])
    @events = @weekend.events.order('start_time ASC')
  end

  def print
    @weekend = @season.weekends.find(params[:id])
    @events = @weekend.events.order('start_time ASC').group_by { |e| e.start_time.strftime("%A #{e.start_time.day.ordinalize} %B") }
  end

  def new
    @weekend = @season.weekends.new
  end

  def edit
    @weekend = @season.weekends.find(params[:id])
  end

  def create
    @weekend = @season.weekends.new(weekend_params)
    if @weekend.save
      redirect_to season_path(@season), notice: 'weekend was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @weekend = @season.weekends.find(params[:id])
    if @weekend.update(weekend_params)
      redirect_to season_weekend_path(@season, @weekend), notice: 'weekend was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @weekend = @season.weekends.find(params[:id])
    @weekend.destroy
    redirect_to season_weekends_path(@season), notice: 'weekend was successfully deleted.'
  end

  private
    def get_season
      @season = Season.find(params[:season_id])
    end

    def weekend_params
      params.require(:weekend).permit(:gp_title, :location, :timespan, :local_timezone, :local_time_offset, :race_number, :season_id)
    end
end
