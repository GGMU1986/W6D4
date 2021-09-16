class ArtworksController < ApplicationController
    # def index
    #     @artworks = Artwork.all
    #     render json: @artworks
    # end    

    # Artwork
    #     .select(:id)
    #     .joins(:artist)
    #     .where(users: {id: :artist_id})

    def index
        #debugger
        if params[:user_id].equal?(:artist_id)
            @artworks = Artwork.joins(:artist).where(artist_id: params[:user_id])
            render json: @artworks
        else
            render json: 'That key does not exist'
        end
        
        # unless params[:user_id] == nil
        #     @artworks = Artwork.joins(:artist).where(artist_id: params[:user_id])
        # else
        #     render text: 'That key does not exist'
        # end

        

        # @artworks = Artwork.joins(:artist).where(artist_id: params[:user_id])
        # render json: @artworks
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to users_url
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end