class ReservationsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
  
  def new
    @reservation = Reservation.new
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end 
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:room_id, :room_img,:introduction, :price,:start_date, :end_date, :number_of_people))
    if @reservation.save
      redirect_to rooms_index_path
    else
      render :new
    end
  end
  
  def show
   @reservation = Reservation.find(params[:id])
   @reservations = Reservation.all
   @rooms = Room.all
  end
  
  def destroy 
    @reservation = Reservation.find(params[:id])
    @reservation.destroy 
    redirect_to :reservations
  end
end
