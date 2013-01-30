class ScoresController < ApplicationController
  before_filter :authenticate_player!

  # GET /games/1/score/new
  def new
    @game = current_player.games.find(params[:game_id])
    respond_to do |format|
      format.html { render }
      format.js   { render }
    end
  end

  # POST /games/1/score
  def create
    @game = current_player.games.find(params[:game_id])
    @game.complete!(params[:game]) unless invalid_game?

    respond_to do |format|
      if @game.complete?
        format.html { redirect_to root_path, notice: I18n.t('game.complete.saved') }
        format.js   { render  }
      else
        format.html {
          flash[:notice] = "Spoon, enter a score"
          render :new
        }
        format.js { render 'scores/invalid_score', layout: false }
      end
    end
  end

private
  def invalid_game?
    params[:game][:challenger_score].blank? or params[:game][:challenged_score].blank?
  end
end
