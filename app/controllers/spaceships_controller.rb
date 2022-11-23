class SpaceshipsController < ApplicationController
    def index
        @spaceships = Spaceship.all
      end

      def show
        @spaceship = Spaceship.find(params[:id])
        @reservation = Reservation.new
      end

      def new
        @spaceship = Spaceship.new
      end

      def create
        @spaceship = Spaceship.new(spaceship_params)
        if @spaceship.save
          redirect_to spaceship_path(@spaceship)
        else
          render :new
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
      end

      private

      def spaceship_params
        params.require(:spaceship).permit(:name, :category, :location, :price, :description, :speed_of_light, :capacity, :fuel_drive, :brand)
      end
end
