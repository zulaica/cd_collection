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

  define_singleton_method(:clear) do
    @@collection = []
  end

  define_singleton_method(:fetch) do |search_by, search_term|
    results = []
    the_cd = []
    @@collection.each() do |cd|
      if search_by == "artist"
        if cd.artist() == search_term
          the_cd = [cd.artist(), cd.album(), cd.year()]
          results.push(the_cd)
        end
      elsif search_by == "album"
        if cd.album() == search_term
          the_cd = [cd.artist(), cd.album(), cd.year()]
          results.push(the_cd)
        end
      end
    end
    results
  end

end
