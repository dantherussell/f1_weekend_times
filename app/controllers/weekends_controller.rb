class WeekendsController < ApplicationController
  def index
    @weekends = Weekend.all
  end

  def show
    @weekend = Weekend.find(params[:id])
    @events = @weekend.events.group_by { |e| e.start_time.strftime("%A %dth %B") }
    puts Time.now.zone
  end
end
