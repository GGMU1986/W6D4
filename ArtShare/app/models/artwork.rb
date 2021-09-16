class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    #validates :country, uniqueness: { scope: [:medium, :another_medium] }
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

end