module Api
  class RacesController < ApplicationController
    before_action :set_race, only: [:show, :update]
    
    def index
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
      else

      end
    end

    def show
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races/#{params[:id]}"
      else
        render json: @race, status: :ok
      end
    end

    def create
      if !request.accept || request.accept == '*/*'
        render plain: race_params[:name], status: :ok
      else
        @race = Race.new(race_params)
        if @race.save
          render plain: race_params[:name], status: :created
        else
          render plain: @race.errors
        end
      end
    end

    def update
      if @race.update(race_params)
        render json: @race, status: :ok
      else
        render plain: @race.errors
      end
    end

    private 
    def race_params
      params.require(:race).permit(:name, :date)
    end

    def set_race
      @race = Race.find(params[:id])
    end
  end
end