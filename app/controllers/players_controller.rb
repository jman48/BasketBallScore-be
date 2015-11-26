class PlayersController < ApplicationController

  def showAll
    players = Player.all
    #join each player with appropriate user
    joined = players.map do |player|
      user = player.user
      player.as_json.merge(user.as_json)
    end

    #put "joined: " + joined.to_s

    respond_to do |format|
      format.json { render :json => joined }
    end
  end

  def update
    params.permit(:username, :score)
    user = User.where(username: params[:username]).take
    player = Player.where(user: user).take
    player.update(score: params[:score])

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
