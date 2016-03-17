module Api
  class RacesController < ApplicationController
    before_action :set_race, only: [:show, :update, :destroy]

    rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      @msg = "woops: cannot find race[#{params[:id]}]"
      if request.accept.nil? || request.accept == '*/*'
        render plain: @msg, status: :not_found
      else
        respond_to do |format|
          format.json { render 'api/error_msg', 
                        status: :not_found, 
                        content_type: "#{request.accept}" }
          format.xml { render 'api/error_msg',
                       status: :not_found,
                       content_type: "#{request.accept}" }
        end
      end
    end

    rescue_from ActionView::MissingTemplate do |exception|
      @msg = "woops: we do not support that content-type[#{request.accept}]"
      render plain: @msg, status: 415
    end
    
    def index
      if request.accept.nil? || request.accept == '*/*'
        render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
      else

      end
    end

    def show
      if request.accept.nil? || request.accept == '*/*'
        render plain: "/api/races/#{params[:id]}"
      else
        render 'race', status: :ok, content_type: "#{request.accept}"
      end
    end

    def create
      if request.accept.nil? || request.accept == '*/*'
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

    def destroy
      @race.destroy
      render nothing: true, status: :no_content
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
