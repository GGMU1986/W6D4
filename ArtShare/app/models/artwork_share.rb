class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence: true
    validates :viewer_id, uniqueness: { scope: :artwork_id, message: 'I already saw this piece of artwork!' }

    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork
    end