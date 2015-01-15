require("rspec")
require("cds")

describe("CD") do
  describe("#store") do
    it("Stores all of the attributes of a CD") do
      test_cd = CD.new({:artist => "Artist", :album => "Album", :year => 2001 })
      test_cd.store()
      expect(CD.all()).to(eq([test_cd]))
    end
  end

end
