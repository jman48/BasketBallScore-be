class GamesController < ApplicationController

  def create
    params.require(:game).permit(:hoopsToWin, :players)

    @game = Game.create(
      hoopsToWin: params[:hoopsToWin],
      is_active: true
    )

    # objects which contain user and player attributes
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

  def showAll
    games = Game.all
    respond_to do |format|
      format.json { render :json => games }
    end
  end
  
  def showGame
    activeGames = Game.where(is_active: true)
    if (activeGames.empty?)
      active = false
    else
      active = activeGames.first
    end
    respond_to do |format|
      format.json { render :json => active }
    end
  end

  def updateActive
    game = Game.find(params[:id])
    game.is_active = params[:isActive]
    respond_to do |format|
      if game.save
        format.json { render :json => game }
      else
        format.json { render json: game.errors, status: :unprocessable_entity }
      end
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

  def deleteAll
    respond_to do |format|
      if Game.destroy_all
        format.json { render :json => "done" }
      else
        format.json { render json: Game.errors, status: :unprocessable_entity}
      end
    end
  end
end
