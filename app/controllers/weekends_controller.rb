class WeekendsController < ApplicationController
  before_action :authenticate, only: %i(destroy edit new create update auth)

  def index
    @weekends = Weekend.all
  end

  def auth
    redirect_to :weekends
  end

  def show
    @weekend = Weekend.find(params[:id])
    @events = @weekend.events.group_by { |e| e.start_time.strftime("%A #{e.start_time.day.ordinalize} %B") }
  end

  def new
    @weekend = Weekend.new
  end

  def edit
    @weekend = Weekend.find(params[:id])
  end

  def create
    @weekend = Weekend.new(weekend_params)
    if @weekend.save
      redirect_to weekends_path, notice: 'weekend was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @weekend = Weekend.find(params[:id])
    if @weekend.update(weekend_params)
      redirect_to weekend_path(@weekend), notice: 'weekend was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @weekend = Weekend.find(params[:id])
    @weekend.destroy
    redirect_to weekends_path, notice: 'weekend was successfully deleted.'
  end

  private
    def weekend_params
      params.require(:weekend).permit(:gp_title, :location, :timespan, :local_timezone, :local_time_offset)
    end
end
