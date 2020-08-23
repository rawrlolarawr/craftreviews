module ReviewsHelper
    def review_owner?(review)
        current_user.id == review.user.id
    end

    def username(review)
        review.user.username
    end
end
