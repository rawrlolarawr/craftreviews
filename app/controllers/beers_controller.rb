class BeersController < ApplicationController
    before_action :set_beer!, only: [:show, :edit, :update, :destroy]

    def index
        @beers = Beer.all
    end
    
    def new
        @beer = Beer.new
    end

    def create
        @beer = Beer.new(beer_params)

        if @beer.save
            redirect_to @beer
        else
            render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @beer.update(beer_params)
            redirect_to @beer
        else
            render :edit
        end
    end

    def destroy
        @beer.destroy
        redirect_to beers_url
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :style, :abv)
    end

    def set_beer!
        @beer = Beer.find_by(id: params[:id])
    end
end
