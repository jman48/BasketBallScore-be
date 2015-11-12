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

  def show
    render json: User.all
  end

  def showUser
    params.permit(:id)
    @user = User.find(params[:id])
    render :json => @user
  end
end
