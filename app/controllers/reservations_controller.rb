class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    flash[:alert] = "Please login first" unless current_user
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.spaceship = @spaceship
    @reservation.user = current_user
    if @reservation.save
      redirect_to spaceship_reservation_path(@spaceship, @reservation)
    else
      render "spaceships/show", status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @spaceship = Spaceship.find(params[:spaceship_id])
    @reservation.spaceship = @spaceship
    @reservation.user = current_user
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @spaceship = Spaceship.find(params[:spaceship_id])

    @reservation.destroy
    redirect_to spaceship_path, status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end



end
