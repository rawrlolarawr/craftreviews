class BeersController < ApplicationController
    before_action :set_beer!, only: [:show, :edit, :update, :destroy]
    before_action :set_brewery!, only: [:index, :new, :create, :edit]
    
    def index
        @beers = @brewery.beers
    end
    
    def new
        @beer = @brewery.beers.build
    end

    def create
        @beer = @brewery.beers.build(beer_params)

        if @beer.save
            flash[:success] = "Beer Created"
            redirect_to brewery_beer_path(@brewery, @beer)
        else
            flash[:error] = @beer.errors.full_messages
            render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @beer.update(beer_params)
            flash[:success] = "Beer Updated"
            redirect_to brewery_beer_path(@beer.brewery, @beer)
        else
            flash[:error] = @beer.errors.full_messages
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
        @brewery = Brewery.find_by(id: params[:brewery_id])
    end
end
