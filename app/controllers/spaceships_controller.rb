class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @spaceships = Spaceship.where(sql_query, query: "%#{params[:query]}%")
    else
      @spaceships = Spaceship.all
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @spaceship = Spaceship.new
  end

  def my_spaceships
    @spaceships = Spaceship.all.where(user: current_user)
  end

  def my_bookings
    @reservations = Reservation.all.where(user: current_user)
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spaceship = Spaceship.find(params[:id])
  end

  def update
    @spaceship = Spaceship.find(params[:id])
    if @spaceship.update(spaceship_params)
      redirect_to spaceship_path(@spaceship)
    else
      render :new
    end
  end

  def destroy
    @spaceship = Spaceship.find(params[:id])
    @spaceship.destroy
    redirect_to spaceship_path(@spaceship), status: :see_other
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :category, :location, :price, :description, :speed_of_light, :capacity, :fuel_drive, :brand, :photo)
  end
end
