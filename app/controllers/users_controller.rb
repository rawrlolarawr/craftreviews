class UsersController < ApplicationController
    before_action :set_user!

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "User Updated"
            redirect_to @user
        else
            flash[:error] = @user.errors.full_messages
            render 'edit'
        end
    end

    private

    def set_user!
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end
