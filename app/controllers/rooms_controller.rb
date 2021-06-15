class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
    @reservations = Reservation.all
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
  
  def new
    @room = Room.new
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end 
  
  def create
    @room = Room.new(params.require(:room).permit(:id,:room_name, :introduction, :price, :address, :room_image))
    if @room.save
      redirect_to rooms_index_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def destroy 
    @room = Room.find(params[:id])
    @room.destroy 
    redirect_to :rooms
  end
end
