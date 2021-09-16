class ArtworksController < ApplicationController
    def index
        @artwork = Artwork.all
        rendor json: @artworks
    end    

    def show
        @artwork = Artwork.find(params[:id])
    end

    def create
        @artwork = Artwork.new(artwork_params)
        @artwork.author = Artwork.first

        if @artwork.save
            redirect_to artwork_url(@artwork)
        else
            rendor json: @artwork.errors.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            rendor json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to users_url
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artwork_id)
    end
end