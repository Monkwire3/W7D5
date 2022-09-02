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
        render :new
    end

    def create

#        @post = Post.new(title: params[:post][:title], body: params[:post][:body], sub: params[:post][:sub], poster: @current_user)

        #if @post.save!
            #redirect_to posts_url
        #else
            #flash.now[:errors] = "Failed to create post"
        #end
    end

    def post_params
        params.require(:post).permit(:title, :body)
        
    end
end
