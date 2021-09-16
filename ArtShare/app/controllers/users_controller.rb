class UserController < ApplicationController
    def index
        @users = User.all
        rendor json: @users
    end    

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        @user.author = User.first

        if @user.save
            redirect_to user_url(@user)
        else
            rendor json: @user.errors.full_messages, status: 422
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            rendor json: @user.errors.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end