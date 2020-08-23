class UsersController < ApplicationController
    before_action :set_user!

    def show
    end

    private

    def set_user!
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
