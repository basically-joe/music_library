require_relative("../db/sql_runner")

class Album


  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      title,
      genre,
      artist_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    sql = "UPDATE albums 
    SET ( title, genre ) = ( $1, $2 ) WHERE id = $3"
      values = [@title, @genre, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM albums
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = "SELECT * FROM albums
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      album_hash = results.first
      album = Album.new(album_hash)
      return album
    end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values).first
    return Artist.new(artist)
  end

  def self.all()
      sql = "SELECT * FROM albums"
      albums = SqlRunner.run(sql)
      return albums.map { |album| Album.new(album) }
    end

  def self.delete_all()
      sql = "DELETE FROM albums"
      SqlRunner.run(sql)
    end

end
