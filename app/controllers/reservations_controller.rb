class ReservationsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation = Reservation.new
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.spaceship = @spaceship
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
  end

  private

  def reservation_params
  params.require(:reservation).permit(:start_date, :end_date)
  end

end
