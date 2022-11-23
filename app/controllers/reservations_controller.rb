class ReservationsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation = Reservation.new
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.spaceship = @spaceship
    @reservation.user = current_user
    if @reservation.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to spaceship_path(@spaceship), status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
