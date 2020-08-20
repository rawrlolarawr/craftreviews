class WelcomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @breweries
        @beers
        @reviews
    end

    def results
        @brewery_results = Brewery.search_by_name(params[:q])
        @beer_results = Beer.search_by_name(params[:q])
        @review_results = Review.search_by_name(params[:q])
    end

    private

    # def welcome_params
    #     params.permit(:q)
    # end
end
