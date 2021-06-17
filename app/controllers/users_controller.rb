class UsersController < ApplicationController
  
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def account
  end

  def update
  end

  def destroy
  end
end
