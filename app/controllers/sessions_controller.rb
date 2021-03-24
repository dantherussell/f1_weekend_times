class SessionsController < ApplicationController
  before_action :get_series
  before_action :authenticate

  def new
    @session = @series.sessions.new
  end

  def edit
    @session = @series.sessions.find(params[:id])
  end

  def create
    @session = @series.sessions.new(session_params)
    if @session.save
      redirect_to series_path(@series), notice: 'session was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @session = Session.find(params[:id])
    if @session.update(session_params)
      redirect_to series_path(@series), notice: 'session was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    redirect_to series_path(@series), notice: 'session was successfully deleted.'
  end

  private
    def get_series
      @series = Series.find(params[:series_id])
    end

    def session_params
      params.require(:session).permit(:name)
    end
end
