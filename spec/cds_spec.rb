require("rspec")
require("cds")

describe("CD") do
  before() do
    CD.clear()
  end

  describe("#store") do
    it("creates a CD class and saves it into the collection array.") do
      test_cd = CD.new({:artist => "Artist", :album => "Album", :year => 2001 })
      test_cd.store()
      expect(CD.all()).to(eq([test_cd]))
    end
  end

  describe("#fetch") do
    it("returns a CD by the artist specified") do
      test_cd = CD.new({:artist => "Artist", :album => "Album", :year => 2001 })
      test_cd.store()
      other_cd = CD.new({:artist => "Craving the Seamstress", :album => "EP 5-15-04", :year => 2004})
      other_cd.store()
      expect(CD.fetch("artist", "Craving the Seamstress")).to(eq([[other_cd.artist(), other_cd.album(), other_cd.year()]]))
    end

    it("returns a CD by the album specified") do
      test_cd = CD.new({:artist => "Teenage Fanclub", :album => "Songs From Northern Britain", :year => 1996})
      test_cd.store()
      expect(CD.fetch("album", "Songs From Northern Britain")).to(eq([[test_cd.artist(), test_cd.album(), test_cd.year()]]))
    end

    it("returns multiple CDs by the artist specified") do
      test_cd = CD.new({:artist => "Man… or Astro-Man?", :album => "Experiment Zero", :year => 1996})
      test_cd.store()
      other_cd = CD.new({:artist => "Man… or Astro-Man?", :album => "Project Infinity", :year => 1995})
      other_cd.store()
      expect(CD.fetch("artist", "Man… or Astro-Man?")).to(eq([[test_cd.artist(), test_cd.album(), test_cd.year()], [other_cd.artist(), other_cd.album(), other_cd.year()]]))
    end
  end
end
