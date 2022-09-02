class PostsController < ApplicationController
    def index
        @posts = Post.all
        render :index
    end

    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def new
        @post = Post.new
        @sub_id = params[:sub_id]
        render :new
    end

    def create

        @post = Post.new(title: post_params[:title], body: post_params[:body], poster: current_user, sub: Sub.find_by(id: post_params[:sub_id]))

        debugger
        if @post.save!
            redirect_to post_url(@post.id)
        else
            flash.new[:errors] = ["Failed to Create Post"]
        end
    end

    def post_params
        params.require(:post).permit(:title, :body, :sub_id)
    end

end
