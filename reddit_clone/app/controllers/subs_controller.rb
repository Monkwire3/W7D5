class SubsController < ApplicationController
    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(title: sub_params[:title], moderator: current_user)

        if @sub.save!
            redirect_to sub_url(@sub.id)
        else
            flash.new[:errors] = "Failed to create sub"
        end
    end
end
