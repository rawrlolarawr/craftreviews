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
            flash[:success] = "Brewery Created"
            redirect_to @brewery
        else
            flash[:error] = @brewery.errors.full_messages
            render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @brewery.update(brewery_params)
            flash[:success] = "Brewery Updated"
            redirect_to @brewery
        else
            flash[:error] = @brewery.errors.full_messages
            render :edit
        end
    end

    def destroy
        @brewery.destroy
        redirect_to breweries_url
    end

    private

    def brewery_params
        params.require(:brewery).permit(:name, :location, :website)
    end

    def set_brewery!
        @brewery = Brewery.find_by(id: params[:id])
    end
end
