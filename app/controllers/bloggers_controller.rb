class BloggersController < ApplicationController

    def index
        @blogger = Blogger.all
    end
    
    def new
        @blogger = Blogger.new
    end
    
    def create
        @blogger = Blogger.new(post_params)

        if @destinations.save
            redirect_to blogger_path(@blogger)
        else
            redirect_to new_blogger_path
        end
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find([params[:id]])
        @blogger.destroy
        redirect_to new_blogger_path
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    private

    def post_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end