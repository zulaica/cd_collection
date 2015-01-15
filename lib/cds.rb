class CD

  @@collection = []

  attr_reader(:artist, :album, :year)

  define_method(:initialize) do |attributes|
    @artist = attributes.fetch(:artist)
    @album = attributes.fetch(:album)
    @year = attributes.fetch(:year)
  end

  define_method(:store) do
    @@collection.push(self)
  end

  define_singleton_method(:all) do
    @@collection
  end

end
