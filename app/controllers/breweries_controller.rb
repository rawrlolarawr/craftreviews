class BreweriesController < ApplicationController
    before_action :set_brewery!, only: [:show, :edit, :update, :destroy]
    
    def index
        @breweries = Brewery.all
    end
    
    def new
        @brewery = Brewery.new
    end

    def create
        @brewery = Brewery.new(brewery_params)

        if @brewery.save
            redirect_to @brewery
        else
            render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
    end

    def destroy
    end

    private

    def brewery_params
        params.require(:brewery).permit(:name, :location, :website)
    end

    def set_brewery!
        @brewery = Brewery.find_by(id: params[:id])
    end
end
