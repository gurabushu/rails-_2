class ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.includes(:room)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.room_id = @room.id
    if @reservation.save
      redirect_to reservation_complete_path
    else
      render 'rooms/show', status: :unprocessable_entity
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    user = @reservation.user
    @reservation.destroy
    redirect_to user_reservations_path(user), notice: "予約を削除しました"
  end

  def show
    @reservation = Reservation.find(params[:id])
    redirect_to user_reservations_path(@reservation.user)
  end

  def complete
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :person)
  end
end
