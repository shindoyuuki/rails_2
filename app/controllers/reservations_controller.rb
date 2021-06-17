class ReservationsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
  
  def new
    @reservation = Reservation.new
    @room = Room.new
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end 
  
  def create
    @reservation = Reservation.new(reservation_params)  
    @reservation.user_id = current_user.id 
    @reservation.save
    redirect_to reservations_posts_path
  end
  
  def show
   @reservation = Reservation.find(params[:id])
   @reservations = Reservation.all
   @rooms = Room.all
  end
  
  def posts
   @reservations = current_user.reservations.all
  end
  
  def destroy 
    @reservation = Reservation.find(params[:id])
    @reservation.destroy 
    redirect_to :reservations
  end
  
   private
    def reservation_params
      params.require(:reservation).permit(:room_id, :room_img,:introduction, :price,:start_date, :end_date, :number_of_people) 
    end
end

