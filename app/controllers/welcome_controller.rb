class WelcomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @breweries
        @beers
        @reviews
    end

    def results

    end
end
