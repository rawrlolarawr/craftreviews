class ReviewsController < ApplicationController
    before_action :set_review!, only: [:show, :edit, :update, :destroy]
    before_action :set_beer!, only: [:new, :create]
    
    def index
        @reviews = Review.all
    end

    def new
        @review = @beer.reviews.build
        @user = current_user
    end

    def create
        @review = @beer.reviews.build(review_params)

        if @review.save
            redirect_to beer_review_path(@beer, @review)
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

    def review_params
        params.require(:review).permit(:content, :user_id)
    end

    def set_review!
        @review = Review.find_by(id: params[:id])
    end

    def set_beer!
        @beer = Beer.find_by(id: params[:beer_id])
    end
end
