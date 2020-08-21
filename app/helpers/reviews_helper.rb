module ReviewsHelper
    def review_owner?(review)
        current_user.id == review.user.id
    end
end
