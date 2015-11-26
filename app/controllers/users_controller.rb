class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    params.require(:user).permit(:username)

    @user = User.new(params.permit(:username))

    respond_to do |format|
      if @user.save
        format.json { render :json => @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def showAll
    render json: User.all
  end

  def show
    params.permit(:id)
    @user = User.find(params[:id])
    render :json => @user
  end

  def changeTotalHoops
    params.permit(:id, :totalHoops)
    @user = User.find(params[:id])

    @user.totalHoops = params[:totalHoops]

    respond_to do |format|
      if @user.save
        format.json { render :json => @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def changeHighestStreak
    params.permit(:id, :highestStreak)
    @user = User.find(params[:id])

    @user.highestStreak = params[:highestStreak]

    respond_to do |format|
      if @user.save
        format.json { render :json => @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    params.permit(:id)
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.destroy
        format.json { render :json => @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def changeShootoutsWon
    params.permit(:id, :shootoutsWon)
    @user = User.find(params[:id])

    @user.shootoutsWon = params[:shootoutsWon]

    respond_to do |format|
      if @user.save
        format.json { render :json => @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
