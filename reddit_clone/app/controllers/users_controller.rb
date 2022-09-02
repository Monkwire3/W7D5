class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(username: params[:user][:username], password: params[:user][:password])

        if @user.save!
            redirect_to users_url
        else
            flash.now[:errors] = "Failed to create User"
        end
    end
end
