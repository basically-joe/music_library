require_relative("../models/artists")
require_relative("../models/albums")
require('pry')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'David Bowie'})
artist2 = Artist.new({'name' => 'Freddy Mercury'})
artist3 = Artist.new({'name' => 'Ice T'})
artist1.save
artist2.save
artist3.save

album1 = Album.new({'title' => 'Scary Monsters', 'genre' => 'Indie', 'artist_id' => artist1.id })
album2 = Album.new({'title' => 'Low', 'genre' => 'Indie',  'artist_id' => artist1.id })
album3 = Album.new({'title' => 'Queens Greatest Hits', 'genre' => 'Rock',  'artist_id' => artist2.id })
album4 = Album.new({'title' => 'Original Gangster (OG)', 'genre' => 'Rap',  'artist_id' => artist3.id })
album1.save
album2.save
album3.save
album4.save

Album.all()
Artist.all()



binding.pry
nil
