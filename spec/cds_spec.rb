require("rspec")
require("cds")

describe("CD") do
  describe("#store") do
    it("creates a CD class and saves it into the collection array.") do
      test_cd = CD.new({:artist => "Artist", :album => "Album", :year => 2001 })
      test_cd.store()
      expect(CD.all()).to(eq([test_cd]))
    end
  end

end
