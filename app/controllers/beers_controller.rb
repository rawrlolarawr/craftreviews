class BeersController < ApplicationController
    before_action :set_beer!, only: [:show, :edit, :update, :destroy]

    def index
        @beers = Beer.all
    end
    
    def new
        set_brewery!
        @beer = @brewery.beers.build
    end

    def create
        raise params
        @beer = @brewery.beers.build(beer_params)

        if @beer.save
            redirect_to brewery_beer_path(@beer.brewery, @beer)
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
            redirect_to brewery_beer_path(@beer.brewery, @beer)
        else
            render :edit
        end
    end

    def destroy
        @beer.destroy
        redirect_to brewery_beers_url
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :style, :abv)
    end

    def set_beer!
        @beer = Beer.find_by(id: params[:id])
    end

    def set_brewery!
        @brewery = Brewery.find_by(params[:brewery_id])
    end
end
