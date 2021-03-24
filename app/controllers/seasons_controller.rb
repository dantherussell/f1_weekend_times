class SeasonsController < ApplicationController
  before_action :authenticate, only: %i(destroy edit new create update auth)

  def index
    @seasons = Season.all
  end

  def auth
    redirect_to :seasons
  end

  def show
    @season = Season.find(params[:id])
    @weekends = @season.weekends
  end

  def new
    @season = Season.new
  end

  def edit
    @season = Season.find(params[:id])
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to seasons_path, notice: 'season was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @season = Season.find(params[:id])
    if @season.update(season_params)
      redirect_to season_path(@season), notice: 'season was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy
    redirect_to seasons_path, notice: 'season was successfully deleted.'
  end

  private
    def season_params
      params.require(:season).permit(:name)
    end
end
