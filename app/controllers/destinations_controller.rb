class DestinationsController < ApplicationController

    def index
        @destination = Destination.all
    end
    
    def new
        @destination = Destination.new
    end
    
    def create
        @destination = Destination.new(post_params)

        if @destinations.save
            redirect_to destination_path(@destination)
        else
            redirect_to new_destination_path
        end
    end

    def edit
        @destination = Destination.find(params[:id])
    end

    def update
        @destination = Destination.find([params[:id]])
        @destination.destroy
        redirect_to new_destination_path
    end

    def show
        @destination = Destination.find(params[:id])
    end

    private

    def post_params
        params.require(:destination).permit(:name, :bio, :age)
    end

end