class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to @tournament
    else
      redirect_to tournaments_path
    end
  end

  def destroy
  end

  private
  def tournament_params
    params.require(:tournament).permit(:name, :year, :date, :level, :division)
  end
end
