# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('users')

Artwork.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('artworks')

user1 = User.create(username: 'DaVinci')
user2 = User.create(username: 'Bob')
user3 = User.create(username: 'Picasso')
user4 = User.create(username: 'Mozart')
user5= User.create(username: 'Steve') 
artwork1 = Artwork.create(title: 'thisis1', image_url: '1.com', artist_id: user1.id)
artwork2 = Artwork.create(title: 'thisis2', image_url: '2.com', artist_id: user1.id)
artwork3 = Artwork.create(title: 'thisis3', image_url: '3.com', artist_id: user2.id)
artwork4 = Artwork.create(title: 'thisis4', image_url: '4.com', artist_id: user2.id)
artwork5 = Artwork.create(title: 'thisis5', image_url: '5.com', artist_id: user2.id)
artwork6 = Artwork.create(title: 'thisis6', image_url: '6.com', artist_id: user3.id)
artwork7 = Artwork.create(title: 'thisis7', image_url: '7.com', artist_id: user4.id)
artwork8 = Artwork.create(title: 'thisis8', image_url: '8.com', artist_id: user5.id)
artwork9 = Artwork.create(title: 'thisis9', image_url: '9.com', artist_id: user5.id)