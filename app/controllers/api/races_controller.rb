module Api
  class RacesController < ApplicationController
    def index
      if !request.accept || request.accept == '*/*'
        render plain: '/api/races'
      else
      end
    end

    def show
      if !request.accept || request.accept == '*/*'
        render plain: "/api/races/#{params[:id]}"
      else
        
      end
    end

    def create
      if !request.accept || request.accept == '*/*'
        render plain: :nothing, status: :ok
      else
        
      end
    end
  end
end