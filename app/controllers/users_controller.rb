class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    username = params.require(:user).permit(:username)

    @user = User.new(username)

    respond_to do |format|
      if @user.save
        #format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :json => @user }
      else
        #format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
