class PlayersController < ApplicationController

  def show
    player = Player.find(params[:id])
    user = player.user
    player.as_json.merge(user.as_json)
    respond_to do |format|
      format.json { render :json => player }
    end
  end

  def showAllInGame
    players = Player.where(game_id: params[:id])
    
    #join each player with appropriate user
    joined = players.map do |player|
      user = player.user
      player.as_json.merge(user.as_json)
    end

    respond_to do |format|
      format.json { render :json => joined }
    end
  end

  def showAll
    players = Player.all

    #join each player with appropriate user
    joined = players.map do |player|
      user = player.user
      player.as_json.merge(user.as_json)
    end

    respond_to do |format|
      format.json { render :json => joined }
    end
  end

  def update
    params.permit(:username, :score, :game_id)
    user = User.where(username: params[:username]).take
    player = Player.where(user: user).where(game_id: params[:game_id]).take

    # update player's score
    player.update(score: params[:score])

    # add 1 to user's total hoops
    user.totalHoops = user.totalHoops + 1
    user.save

    respond_to do |format|
      if player.save
        format.json { render :json => player }
      else
        format.json { render json: player.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
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
        format.json { render :json => {statusText: "done"} }
      end
    end
  end

end
