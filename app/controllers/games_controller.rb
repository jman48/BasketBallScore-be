class GamesController < ApplicationController

  def create
    params.require(:game).permit(:hoopsToWin, :id, :players)

    @game = Game.new(
      hoopsToWin: params[:hoopsToWin]
    )
    @game.save

    @players = params[:players]

    @players.each_with_index do |player, index|

      player = Player.new(
        game_id: @game[:id],
        user_id: @players[index][:id],
        score: 0
      )
      player.save
    end

    respond_to do |format|
      format.json { render :json => @game }
    end
  end

  def showPlayers
    players = Player.all
    respond_to do |format|
      format.json { render :json => players }
    end
  end

  def showGames
    games = Game.all
    respond_to do |format|
      format.json { render :json => games }
    end
  end

  def delete
    params.require(:id)

    if Game.find(params[:id]).destroy
      respond_to do |format|
        format.json { render :json => "done" }
      end
    end
  end

end
