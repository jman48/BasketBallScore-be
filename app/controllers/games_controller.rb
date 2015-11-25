class GamesController < ApplicationController

  def create
    params.require(:game).permit(:hoopsToWin, :id, :players)

    @game = Game.create(
      hoopsToWin: params[:hoopsToWin]
    )

    @players = params[:players]

    @players.each_with_index do |player, index|

      player = Player.create(
        game: @game,
        user_id: @players[index][:id],
        score: 0
      )
    end

    respond_to do |format|
      format.json { render :json => @game }
    end
  end

  def showPlayers
    players = Player.all
    #join each player with appropriate user
    joined = players.map do |player|
      user = User.find(player[:user_id])
      player.as_json.merge(user.as_json)
    end

    #put "joined: " + joined.to_s

    respond_to do |format|
      format.json { render :json => joined }
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

  def deletePlayer
    params.require(:id)

    if Player.find(params[:id]).destroy
      respond_to do |format|
        format.json { render :json => "done" }
    end
    end
  end

  def deleteAll
    if Game.destroy_all
      respond_to do |format|
        format.json { render :json => "done" }
      end
    end
  end

end
