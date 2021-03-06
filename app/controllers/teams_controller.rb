class TeamsController < ApplicationController
  def index
    if params[:tournament_id]
      @tournament = Tournament.find(params[:tournament_id])
      @teams = @tournament.teams
    else
      @teams = Teams.all
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.tournament_id = params[:tournament_id]
    if @team.save!
      redirect_to tournament_team_path(@team.tournament_id, @team.id)
    else
      redirect_to tournament_teams_path
    end
  end

  def destroy
    @team = Team.find(params[:id])
    tournament_id = @team.tournament_id
    if @team.destroy
      redirect_to tournament_teams_path(tournament_id)
    else
      redirect_to touranment_team(tournament_id, @team.id)
    end
  end

  def penalize
    @penalty = Penalty.new
  end

  private 

  def team_params
    params.require(:team).permit(:school, :suffix, :number, :city, :state, :subdivision, :exhibition)
  end
end
