class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end


    def create
        @user = User.find_by_credentials(user_params[:username], user_params[:password])

        if @user != nil
            login(@user)
            redirect_to users_url
        else
            flash.now[:errors] = ["Invalid Credentials"]
            redirect_to new_session_url
        end
    end

    def destroy
        logout
        flash[:messages] = ["Successfully logged out"]
        redirect_to new_session_url
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
