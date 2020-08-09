class UsersController < ApplicationController
    before_action :set_user!

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_user!
        @user = current_user
    end
end
