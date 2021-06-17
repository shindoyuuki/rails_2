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
    @room = Room.new(room_params)  
    @room.user_id = current_user.id 
    @room.save
    redirect_to rooms_posts_path
  end
 
  def posts
    @rooms = current_user.rooms.all
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
  
  private
    def room_params
      params.require(:room).permit(:id,:room_name,:user_id, :introduction, :price, :address, :room_image) 
    end
end
